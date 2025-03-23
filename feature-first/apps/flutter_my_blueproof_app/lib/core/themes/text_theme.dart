import 'package:flutter/material.dart';

TextTheme createTextTheme(BuildContext context) {
  final baseTextTheme = Theme.of(context).textTheme;
  final bodyTextTheme = baseTextTheme;
  final displayTextTheme = baseTextTheme;
  final textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
