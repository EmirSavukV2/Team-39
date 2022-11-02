import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fread/Model/book_model.dart';
import 'package:fread/Screens/home/Book/book_detail.dart';
import 'package:get/get.dart' hide Trans;
import 'package:palette_generator/palette_generator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/style.dart';

class DemoBookBuilder extends StatefulWidget {
  const DemoBookBuilder({super.key});

  @override
  State<DemoBookBuilder> createState() => _DemoBookBuilderState();
}

class _DemoBookBuilderState extends State<DemoBookBuilder> {
  @override
  void initState() {
    super.initState();
  }

  _updatePalettes(String imageUrl) async {
    final PaletteGenerator generator =
        (await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
      size: const Size(100, 100),
    ));
    List colors = generator.colors.toList();
    print("Color bu la $colors");
    return colors[0] as Color?;
  }

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
            return const Text('Something went wrong');
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
                  child: FutureBuilder(
                      future: _updatePalettes(books.thumbnail!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return BookList(
                            imageUrl: books.thumbnail!,
                            color: snapshot.data as Color?,
                            onPress: () => Get.to(
                              BookDetail(books: books),
                            ),
                          );
                        } else {
                          return BookList(
                            imageUrl: books.thumbnail!,
                            color: Colors.white,
                            onPress: () => Get.to(
                              BookDetail(books: books),
                            ),
                          );
                        }
                      }),
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
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => loadShimmer(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget loadShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.red,
      highlightColor: Colors.yellow,
      child: const SizedBox(width: 114, height: 100),
    );
  }
}
