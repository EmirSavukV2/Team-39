import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  List<Widget> cards = [
    CarouselCard(
        imageUrl: "assets/images/books/killingsong.jpg", onPressed: () {}),
    CarouselCard(
        imageUrl: "assets/images/books/sherlock.jpg", onPressed: () {}),
    CarouselCard(
        imageUrl: "assets/images/books/lordoftherings.jpg", onPressed: () {})
  ];

  final double carouselItemMargin = 16;

  late PageController _pageController;
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: cards.length,
        onPageChanged: (int position) {
          setState(() {
            _position = position;
          });
        },
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        });
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Container(
          margin: EdgeInsets.all(carouselItemMargin),
          child: Center(child: widget),
        );
      },
      child: Container(
        child: cards[position],
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  final String imageUrl;
  final Function() onPressed;

  const CarouselCard({
    required this.imageUrl,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0,
                      color: Colors.white.withOpacity(0.2)),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.5),
                child: Image.asset(imageUrl),
              ),
            ),
          )
        ],
      ),
    );
  }
}
