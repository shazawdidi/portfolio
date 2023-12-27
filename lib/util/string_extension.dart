import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

extension intExt on String {
  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.asset(
      this,
      height: size ?? 24,
      width: size ?? 24,
      fit: fit ?? BoxFit.cover,
    );
  }
}
