import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fread_tested/demo/files_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PDFDoc? _pdfDoc;
  String _text = "";

  Timer? timers;
  int factor = 0;
  double speed = 800.0;
  bool working = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Text Example'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Colors.blueAccent),
              onPressed: _pickPDFText,
              child: const Text(
                "Pick PDF document",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Colors.blueAccent),
              onPressed: () {
                if (_pdfDoc == null || working) {
                  return;
                }
                _readRandomPage(10);
              },
              child: const Text(
                "Yazıyı Başlat",
                style: TextStyle(color: Colors.white),
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  _startOrStop();
                },
                child: const Icon(
                  Icons.pause,
                )),
            Slider(
              value: speed,
              max: 1000,
              divisions: 50,
              label: speed.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _timeChange(value);
                });
              },
            ),
            ElevatedButton(
                onPressed: getPDFList, child: const Text("Shared Get")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FilesPage(
                        files: getPDFList(),
                      ),
                    ),
                  );
                },
                child: const Text("Go List")),
            ElevatedButton(
                onPressed: () {
                  readBooks(pdfLists.last);
                },
                child: const Text("Read Text")),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                _pdfDoc == null
                    ? "Pick a new PDF document and wait for it to load..."
                    : "PDF document loaded, ${_pdfDoc!.length} pages\n",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                _text == "" ? "" : "Text:",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Text(_text),
            Text(pdfLists.toString()),
          ],
        ),
      ),
    );
  }

  void _timeChange(double value) {
    timers?.cancel();
    speed = value;
    _readRandomPage(factor);
  }

  Future<File> saveFilePeramently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  List<String> pdfLists = [];

  /// Picks a new PDF document from the device
  Future _pickPDFText() async {
    var filePickerResult =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (filePickerResult != null) {
      for (var i = 0; i < filePickerResult.files.length; i++) {
        final newFile = await saveFilePeramently(filePickerResult.files[i]);
        pdfLists.add(newFile.path);
      }
      addPDFList();
      // _pdfDoc = await PDFDoc.fromPath(filePickerResult.files.single.path!);
      setState(() {});
    }
  }

  void addPDFList() async {
    setState(() {
      prefs!.setStringList('pdf', pdfLists);
    });
  }

  getPDFList() async {
    return prefs!.getStringList('pdf');
  }

  /// Reads a random page of the document
  _readRandomPage(palace) {
    String text;
    (_pdfDoc!.text).then((value) {
      working = true;
      text = value;
      final textt = text.split(" ");
      factor = palace;
      timers = Timer.periodic(Duration(milliseconds: speed.toInt()), (timer) {
        factor++;
        setState(() {
          _text = textt[factor];
        });
      });
    });
  }

  void _startOrStop() {
    if (working) {
      working = false;
      timers?.cancel();
    } else {
      _readRandomPage(factor);
    }
  }

  readBooks(String books) async {
    _pdfDoc = await PDFDoc.fromPath(books);
  }
}
