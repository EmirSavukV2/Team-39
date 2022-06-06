library sidebarhead;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fread/constants/style.dart';

import 'components/sidebar_footer.dart';
import 'components/sidebar_item.dart';

part 'components/sidebar_head.dart';

List<Widget> sidebarItems = [
  SidebarItem(
    icon: Icons.notifications_none,
    title: "Notification",
    notify: "2",
    onPress: () {},
  ),
  SidebarItem(
    icon: Icons.bookmark_border,
    title: "Bookmarks",
    onPress: () {},
  ),
  SidebarItem(
    icon: Icons.star_border,
    title: "Subscription Plan",
    onPress: () {},
  ),
  SidebarItem(
    icon: Icons.settings,
    title: "Account Settings",
    onPress: () {},
  ),
  SidebarItem(
    icon: Icons.exit_to_app,
    title: "Log out",
    exit: true,
    onPress: () {
      print("BASTIN");
    },
  ),
  SizedBox(height: kDefaultPadding * 2),
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
];

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
                  SizedBox(
                    height: double.maxFinite,
                    child: ListView.builder(
                        itemCount: sidebarItems.length,
                        itemBuilder: (BuildContext context, index) {
                          return sidebarItems[index];
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
