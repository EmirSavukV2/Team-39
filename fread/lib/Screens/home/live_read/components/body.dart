import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_text/pdf_text.dart';

class Body extends StatefulWidget {
  final String bookName, pdf;
  const Body({
    Key? key,
    required this.bookName,
    required this.pdf,
  }) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Color _bgColor = Colors.black87;
  Color _textColor = Colors.white70;
  PDFDoc? _pdfDoc;
  String _text = "";
  Timer? timers;
  int factor = 0;
  double speed = 800.0;
  bool working = false;
  bool first = false;
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _bgColor,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                _text,
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
                      onPressed: () {
                        print(widget.pdf);
                      },
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
                    _startOrStop();
                    print(widget.pdf);
                    if (!first) {
                      pickPDFText();
                      first = true;
                    }
                  });
                },
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Icon(
                  working == true ? Icons.pause : Icons.play_arrow,
                ),
              ),
            )
          ],
        ));
  }

  void _timeChange(double value) {
    timers?.cancel();
    speed = value;
    _readRandomPage(factor);
  }

  /// Picks a new PDF document from the device
  Future pickPDFText() async {
    File asd = File(widget.pdf);
    var _pdfDoc = await PDFDoc.fromFile(asd);

    setState(() {});
  }

  /// Reads a random page of the document
  _readRandomPage(palace) {
    String text;
    (_pdfDoc?.text)?.then((value) {
      working = true;
      text = value;
      final textt = text.split(" ");
      factor = palace;
      timers = Timer.periodic(Duration(milliseconds: speed.toInt()), (timer) {
        factor++;
        setState(() {
          _text = textt[factor];
          print(_text);
        });
      });
    });
  }

  void _startOrStop() {
    if (working) {
      working = false;
      timers?.cancel();
      _bgColor = Colors.red;
      _textColor = Colors.white;
    } else {
      _readRandomPage(factor);
      _bgColor = Colors.black87;
      _textColor = Colors.white;
    }
  }
}
