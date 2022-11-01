import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fread/Model/book_model.dart';

import '../../../../constants/style.dart';

class DemoBookBuilder extends StatelessWidget {
  DemoBookBuilder({super.key});
  final Stream<QuerySnapshot> _booksStream =
      FirebaseFirestore.instance.collection('books').snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 4,
      child: StreamBuilder<QuerySnapshot>(
        stream: _booksStream,
        builder:
            (BuildContext? context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SizedBox(
            height: size.height / 4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                final json = document.data()! as Map<String, dynamic>;
                final books = Books.fromJson(json);
                return Padding(
                  padding: EdgeInsets.only(right: kDefaultPadding),
                  child: BookList(
                      imageUrl: books.thumbnail!, color: Colors.red[200]),
                );
              }).toList(),
            ),
          );

          // Add throw and write your code here
        },
      ),
    );
  }
}

class BookList extends StatelessWidget {
  final String imageUrl;
  final Color? color;
  final Function()? onPress;
  const BookList({
    Key? key,
    required this.imageUrl,
    required this.color,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: color!.withOpacity(.2),
            boxShadow: [
              BoxShadow(
                color: color!.withOpacity(.2),
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.5),
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
