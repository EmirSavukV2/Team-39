import 'package:flutter/material.dart';
import 'package:fread/Screens/home/Main/components/book_list.dart';

import 'package:fread/constants/style.dart';

import 'cattegort_list.dart';
import 'layout_head.dart';
import 'main_carousel.dart';
import 'user_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height / 2.8,
              child: const CustomCarousel(),
            ),
            const LayoutHeader(
              title: "Categories",
              view: "View all",
            ),
            CategoriesBuilder(),
            SizedBox(height: kDefaultPadding),
            const LayoutHeader(
              title: "Recently added",
              view: "View all",
            ),
            BookBuilder(),
            SizedBox(height: kDefaultPadding),
            const LayoutHeader(
              title: "Top Fast User",
              view: "View all",
            ),
            UserBuilder(),
            SizedBox(height: kDefaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
