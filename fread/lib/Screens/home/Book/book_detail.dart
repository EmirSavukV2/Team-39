library BookDetail;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fread/Model/book_model.dart';
import 'package:fread/constants/style.dart';
import 'package:fread/Screens/home/live_read/live_read.dart';
import 'package:get/get.dart' hide Trans;
import 'package:shimmer/shimmer.dart';

part 'components/body.dart';

class BookDetail extends StatelessWidget {
  Books? books;

  BookDetail({
    Key? key,
    this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.chrome_reader_mode_outlined),
      ),
      body: books != null
          ? Body(books: books!)
          : const Center(
              child: Text("Book is null"),
            ),
    );
  }
}
