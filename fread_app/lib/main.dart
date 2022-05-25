import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fread/files_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_text/pdf_text.dart';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((value) {
    prefs = value;
    runApp(HomeApp());
  });
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

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

class LiveRead extends StatefulWidget {
  const LiveRead({Key? key}) : super(key: key);

  @override
  State<LiveRead> createState() => LiveReadState();
}

class LiveReadState extends State<LiveRead> {
  Color _bgColor = Colors.black87;
  Color _textColor = Colors.white70;
  bool wait = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: _bgColor,
              ),
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white70,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: const Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Book Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Deneme Text",
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: _textColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            alignment: Alignment.topCenter,
                            onPressed: () {},
                            icon: Icon(
                              Icons.minimize,
                              color: _textColor,
                            ),
                          ),
                          Text(
                            'Your Speed: 100 mhz',
                            style: TextStyle(color: _textColor),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add, color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (wait) {
                            wait = !wait;
                            _bgColor = Colors.red;
                            _textColor = Colors.white;
                          } else {
                            _bgColor = Colors.black87;
                            _textColor = Colors.white;
                            wait = true;
                          }
                        });
                      },
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        wait == true ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
