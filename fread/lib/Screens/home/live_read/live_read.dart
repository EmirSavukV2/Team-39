import 'package:flutter/material.dart';

import 'components/body.dart';

class LiveRead extends StatefulWidget {
  const LiveRead({Key? key}) : super(key: key);

  @override
  State<LiveRead> createState() => LiveReadState();
}

class LiveReadState extends State<LiveRead> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
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
          title: Text(
            arguments['title'].toString(),
          ),
        ),
        body: Body(
          bookName: arguments['title'].toString(),
          pdf: arguments['pdf'].toString(),
        ),
      ),
    );
  }
}
