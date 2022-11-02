import 'package:flutter/material.dart';

import '../../../../constants/style.dart';

class UserBuilder extends StatelessWidget {
  UserBuilder({Key? key}) : super(key: key);
  List<Widget> books = [
    UserList(
      imageUrl: "assets/images/avatars/avataaars.png",
    ),
    UserList(
      imageUrl: "assets/images/avatars/avataaars.png",
    ),
    UserList(
      imageUrl: "assets/images/avatars/avataaars.png",
    ),
    UserList(
      imageUrl: "assets/images/avatars/avataaars.png",
    ),
    UserList(
      imageUrl: "assets/images/avatars/avataaars.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width / 4 - (kDefaultPadding * 2),
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

class UserList extends StatelessWidget {
  final String imageUrl;
  final Function()? onPress;
  const UserList({
    Key? key,
    required this.imageUrl,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size.width / 6,
        height: size.width / 6,
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.2),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(.2),
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.5),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
