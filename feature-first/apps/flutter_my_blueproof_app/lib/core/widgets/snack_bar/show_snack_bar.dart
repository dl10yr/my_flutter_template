import 'package:flutter/material.dart';

/// Shows a snack bar with the given [message].
///
/// The [context] is used to access the ScaffoldMessenger.
/// [backgroundColor] defaults to null, using the theme's snackBarTheme.
/// [textColor] defaults to null, using the theme's snackBarTheme.
/// [duration] defaults to 4 seconds.
void showSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  Color? textColor,
  Duration duration = const Duration(seconds: 4),
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: textColor != null ? TextStyle(color: textColor) : null,
    ),
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
