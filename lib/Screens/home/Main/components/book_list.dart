import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:shimmer/shimmer.dart';

import 'package:fread/Model/book_model.dart';
import 'package:fread/Screens/home/Book/book_detail.dart';

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

  List<Color> colors = [Colors.red, Colors.black];

  // _updatePalettes(String imageUrl) async {
  //   final PaletteGenerator generator =
  //       (await PaletteGenerator.fromImageProvider(
  //     NetworkImage(imageUrl),
  //     size: const Size(100, 100),
  //   ));
  //   colors[0] = generator.lightVibrantColor?.color ?? Colors.red;
  //   colors[1] = generator.darkVibrantColor?.color ?? Colors.red;
  //   return true;
  // }

  final Stream<QuerySnapshot> _booksStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 4,
      padding: EdgeInsets.only(left: kDefaultPadding),
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
                  child: BookList(
                    imageUrl: books.thumbnail!,
                    colorLight: colors[0],
                    colorDark: colors[1],
                    onPress: () => Get.to(
                      BookDetail(books: books),
                    ),
                  ),
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
  final Color? colorLight;
  final Color? colorDark;
  final Function()? onPress;
  const BookList({
    Key? key,
    required this.imageUrl,
    this.colorLight,
    this.colorDark,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: colorLight!.withOpacity(.2),
            boxShadow: [
              BoxShadow(
                color: colorDark!.withOpacity(.2),
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
