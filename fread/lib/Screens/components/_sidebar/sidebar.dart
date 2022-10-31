library sidebar;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
part 'sidebar_item.dart';

class SideBar extends StatelessWidget {
  SideBar({
    Key? key,
  }) : super(key: key);

  List<Widget> sidebarItems = [
    SidebarItem(
      icon: Icons.book_outlined,
      title: "Testa",
      onPress: () {},
      gColors: const [
        Color(0xffF6F4F0),
        Color(0xffFEECE8),
      ],
    ),
    SidebarItem(
      icon: Icons.bookmark_border,
      align: Alignment.bottomCenter,
      title: "Test",
      subtitle: "off",
      onPress: () {
        print("");
      },
      gColors: const [
        Color(0xffF4F2EE),
        Color(0xffE2EFF3),
      ],
    ),
    SidebarItem(
      image: "assets/images/avatars/avataaars.png",
      align: Alignment.bottomCenter,
      title: "Profile",
      onPress: () {
        print("");
      },
      gColors: const [
        Color(0xffFEECE8),
        Color(0xffF6F4F0),
      ],
    ),
    SidebarItem(
      icon: Icons.bookmark_border,
      align: Alignment.bottomCenter,
      title: "Test",
      subtitle: "off",
      onPress: () {
        print("");
      },
      gColors: const [
        Color(0xffF4F2EE),
        Color(0xffE2EFF3),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: Colors.white,
      child: GridView.builder(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
          ),
          itemCount: sidebarItems.length,
          itemBuilder: (BuildContext context, inedex) {
            return Center(child: sidebarItems[inedex]);
          }),
    );
  }
}
