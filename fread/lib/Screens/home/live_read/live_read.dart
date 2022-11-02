import 'package:flutter/material.dart';
import 'package:fread/Model/book_model.dart';

import 'components/body.dart';

class LiveRead extends StatelessWidget {
  final Books? books;
  const LiveRead({super.key, this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white70,
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: Text(books?.name ?? "Book Name"),
      ),
      body: books != null
          ? Body(books: books!)
          : const Center(
              child: Text("Book is null"),
            ),
    );
  }
}
