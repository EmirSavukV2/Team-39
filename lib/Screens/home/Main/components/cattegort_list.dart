import 'package:flutter/material.dart';

import '../../../../constants/style.dart';

class CategoriesBuilder extends StatelessWidget {
  CategoriesBuilder({Key? key}) : super(key: key);
  List<Widget> categories = [
    CategoriesList(
      title: "Health",
      icon: Icon(
        Icons.heart_broken,
        color: Colors.red,
      ),
    ),
    CategoriesList(
      title: "Motivation",
      icon: Icon(
        Icons.flash_on,
        color: Colors.yellow,
      ),
    ),
    CategoriesList(
      title: "Secience",
      icon: Icon(
        Icons.science,
        color: Colors.black87,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 42,
      child: ListView.builder(
          padding: EdgeInsets.only(left: kDefaultPadding),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(right: kDefaultPadding),
              child: categories[index],
            );
          }),
    );
  }
}

class CategoriesList extends StatelessWidget {
  final String title;
  final Icon icon;

  final Function()? onPress;

  CategoriesList({
    Key? key,
    required this.title,
    required this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          padding: EdgeInsets.all(kDefaultPadding / 2),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              icon,
              SizedBox(width: 8),
              Text(title),
            ],
          )),
    );
  }
}
