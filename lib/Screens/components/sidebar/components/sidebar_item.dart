import 'package:flutter/material.dart';

import '../../../../constants/style.dart';

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
