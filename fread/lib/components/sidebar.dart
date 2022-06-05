import 'package:flutter/material.dart';

import 'package:fread/constants/style.dart';

List<Widget> sidebarItems = [
  SidebarItem(
    image: "assets/images/avatars/avataaars.png",
    align: Alignment.bottomCenter,
    title: "Testa",
    onPress: () {},
  ),
  SidebarItem(
    image: "assets/images/avatars/avataaars.png",
    align: Alignment.bottomCenter,
    title: "Test",
    subtitle: "off",
    onPress: () {
      print("");
    },
  )
];

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

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

class SidebarItem extends StatelessWidget {
  String image, title, subtitle;
  Alignment align;
  void Function()? onPress;
  SidebarItem({
    Key? key,
    required this.image,
    required this.title,
    this.onPress,
    this.subtitle = "",
    this.align = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width / 3 - (kDefaultPadding * 2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: ClipOval(
            child: Padding(
              padding: EdgeInsets.only(
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  top: kDefaultPadding / 2,
                  bottom: 0),
              child: InkWell(
                onTap: onPress,
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                child: Image.asset(
                  image,
                  alignment: align,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Text(title, style: Theme.of(context).textTheme.bodyText2),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.normal, color: kTextColor),
        ),
      ],
    );
  }
}
