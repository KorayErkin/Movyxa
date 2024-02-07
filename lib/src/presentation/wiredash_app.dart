// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_two/src/presentation/themes/theme_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key? key,
    required this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movyxa-app-lj8vqe8',
      secret: 'QPr55CKDfCxJ8qR3C8g_fggiQWHG3XPo',
      navigatorKey: navigatorKey,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryBackgroundColor: AppColor.blackBgColor,
        primaryColor: AppColor.greenBgColor,
        secondaryColor: AppColor.greenBgColor,
        secondaryBackgroundColor: AppColor.blackBgColor,
        errorColor: AppColor.redErrorTextColor,
      ),
      child: child,
    );
  }
}
