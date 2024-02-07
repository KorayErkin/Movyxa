// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:project_two/src/presentation/app_localizations.dart';

extension StringExtension on String {
  String intelliTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this) ?? '';
  }
}
