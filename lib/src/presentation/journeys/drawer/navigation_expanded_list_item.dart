// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_two/src/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:project_two/src/presentation/themes/theme_color.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final void Function(int) onPressed;
  final List<String> children;

  const NavigationExpandedListItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.transparentBgColor,
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          for (int i = 0; i < children.length; i++)
            NavigationSubListItem(
              title: children[i],
              onPressed: () => onPressed(i),
            ),
        ],
      ),
    );
  }
}
