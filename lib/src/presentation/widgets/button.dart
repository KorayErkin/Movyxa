// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/common/extensions/string_extensions.dart';
import 'package:project_two/src/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greenBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            Sizes.dimen_20.w.toDouble(),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_16.w.toDouble(),
      ),
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dimen_10.h.toDouble(),
      ),
      height: Sizes.dimen_16.h.toDouble(),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
