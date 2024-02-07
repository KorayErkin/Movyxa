// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_two/src/common/constants/size_constants.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';
import 'package:project_two/src/presentation/themes/theme_color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _inconsolataTextTheme =>
      GoogleFonts.inconsolataTextTheme();

  static TextStyle get _whiteHeadline6 =>
      _inconsolataTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: AppColor.whiteTextColor,
      );

  static TextStyle get _whiteHeadline5 =>
      _inconsolataTextTheme.headline5!.copyWith(
        fontSize: Sizes.dimen_24.sp.toDouble(),
        color: AppColor.whiteTextColor,
      );

  static TextStyle get whiteSubtitle1 =>
      _inconsolataTextTheme.subtitle1!.copyWith(
        fontSize: Sizes.dimen_16.sp.toDouble(),
        color: AppColor.whiteTextColor,
      );

  static TextStyle get _whiteButton => _inconsolataTextTheme.button!.copyWith(
        fontSize: Sizes.dimen_14.sp.toDouble(),
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  static TextStyle get whiteBodyText2 =>
      _inconsolataTextTheme.bodyText2!.copyWith(
        color: AppColor.whiteTextColor,
        fontSize: Sizes.dimen_14.sp.toDouble(),
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get greenSubtitle1 => subtitle1!.copyWith(
        color: AppColor.greenTextColor,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => subtitle1!.copyWith(
        color: AppColor.greyTextColor,
      );

  TextStyle get goldHeadline6 => headline6!.copyWith(
        color: AppColor.goldTextColor,
      );

  TextStyle get blackBodyText2 => bodyText2!.copyWith(
        color: AppColor.blackTextColor,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greyCaption => caption!.copyWith(
        color: AppColor.greyTextColor,
      );
}
