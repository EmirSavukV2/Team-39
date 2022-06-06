import 'package:flutter/material.dart';

import '../../../constants/style.dart';

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
