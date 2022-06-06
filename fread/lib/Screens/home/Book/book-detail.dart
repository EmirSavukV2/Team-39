import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

import '../../../components/sidebar/sidebar.dart';
import 'components/body.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      body: Body(
        title: arguments['title'].toString(),
        author: arguments['author'].toString(),
        page: arguments['page'].toString(),
        lang: arguments['lang'].toString(),
        rate: arguments['rate'].toString(),
        intro: arguments['intro'].toString(),
        image: arguments['image'].toString(),
        pdf: arguments['pdf'].toString(),
      ),
    );
  }
}
