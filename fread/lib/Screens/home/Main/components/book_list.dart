import 'package:flutter/material.dart';

import '../../../../constants/style.dart';

class BookBuilder extends StatelessWidget {
  const BookBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> books = [
      BookList(
        imageUrl: "assets/images/books/killingsong.jpg",
        color: Colors.orange[900]!,
        onPress: () {
          Navigator.pushNamed(context, '/book-detail', arguments: {
            "title": "Sherlock HOLMES Tanık",
            "author": "Sir Arthur Conan Doyle",
            "page": "254",
            "lang": "TR",
            "rate": "4.5",
            "intro": "Inro Text",
            "image": "assets/images/books/sherlock.jpg",
            "pdf": "assets/book/nur.pdf"
          });
        },
      ),
      BookList(
        imageUrl: "assets/images/books/lordoftherings.jpg",
        color: Colors.blue[900]!,
      ),
      BookList(
        imageUrl: "assets/images/books/sherlock.jpg",
        color: Colors.yellow[200]!,
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 4,
      child: ListView.builder(
          padding: EdgeInsets.only(left: kDefaultPadding),
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(right: kDefaultPadding),
              child: books[index],
            );
          }),
    );
  }
}

class BookList extends StatelessWidget {
  final String imageUrl;
  final Color color;
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
            color: color.withOpacity(.2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(.2),
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.5),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
