import 'package:flutter/material.dart';

import '../../../../constants/style.dart';

class LayoutHeader extends StatelessWidget {
  final String title;
  final String view;
  const LayoutHeader({Key? key, required this.title, required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 22),
          ),
          Text(
            view,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
