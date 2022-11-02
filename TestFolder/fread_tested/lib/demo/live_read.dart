import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
          backgroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Book Name",
          ),
        ),
        body: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: _bgColor,
            ),
            child: Stack(
              children: [
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
    );
  }
}
