import 'package:flutter/material.dart';
import 'package:project_two/src/common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/app_text_logo/movyxa_text_logo.png',
      color: Colors.white,
      height: height.h.toDouble(),
    );
  }
}
