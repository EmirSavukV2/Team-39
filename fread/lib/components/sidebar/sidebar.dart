library sidebarhead;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fread/constants/style.dart';

part 'sidebar_head.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              leading: const BackButton(color: kPrimaryColor),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding * 2),
              child: Column(
                children: [
                  SidebarHead(
                    title: "Emir SAVUK",
                    subtitle: "You're rock",
                    alttitle: "You've finished last book in 3 days",
                    image: "assets/images/avatars/avataaars.png",
                    align: Alignment.bottomCenter,
                    gColors: [
                      Colors.yellow[300]!,
                      Colors.orange[300]!,
                    ],
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  SidebarItem(
                    icon: Icons.notifications_none,
                    title: "Notification",
                    notify: "2",
                    onPress: () {
                      print("BASTIN");
                    },
                  ),
                  SidebarItem(
                    icon: Icons.bookmark_border,
                    title: "Bookmarks",
                    onPress: () {
                      print("BASTIN");
                    },
                  ),
                  SidebarItem(
                    icon: Icons.star_border,
                    title: "Subscription Plan",
                    onPress: () {
                      print("BASTIN");
                    },
                  ),
                  SidebarItem(
                    icon: Icons.settings,
                    title: "Account Settings",
                    onPress: () {
                      print("BASTIN");
                    },
                  ),
                  SidebarItem(
                    icon: Icons.exit_to_app,
                    title: "Log out",
                    exit: true,
                    onPress: () {
                      print("BASTIN");
                    },
                  ),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SidebarFooterItem(
                        icon: Icons.menu_book_rounded,
                        title: "18 Books",
                        subtitle: "You Have",
                      ),
                      SidebarFooterItem(
                        icon: Icons.access_time,
                        title: "158 h",
                        subtitle: "of reading",
                      ),
                      SidebarFooterItem(
                        icon: Icons.task_alt,
                        title: "5 books",
                        subtitle: "done",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarFooterItem extends StatelessWidget {
  IconData? icon;

  String title, subtitle;

  SidebarFooterItem({
    Key? key,
    this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
          size: 28,
        ),
        SizedBox(height: kDefaultPadding),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 4),
        Text(subtitle, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}

class SidebarItem extends StatelessWidget {
  IconData? icon;
  String title;
  String? notify;
  bool exit;
  void Function()? onPress;

  SidebarItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
    this.exit = false,
    this.notify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: kDefaultPadding, top: kDefaultPadding),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]!, width: 1),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: (exit) ? Colors.red : kPrimaryColor,
            ),
            SizedBox(width: kDefaultPadding),
            Text(
              title,
              style: TextStyle(color: (exit) ? Colors.red : kPrimaryColor),
            ),
            Spacer(),
            notify != null
                ? Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: kPrimaryColor,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      notify!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
