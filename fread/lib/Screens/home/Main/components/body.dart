import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 1,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: kDefaultPadding * 2,
          right: kDefaultPadding * 2,
          top: kDefaultPadding * 2,
          bottom: kDefaultPadding,
        ),
        child: Column(
          children: [Image.asset("assets/images/avatars/avataaars.png")],
        ));
  }
}
