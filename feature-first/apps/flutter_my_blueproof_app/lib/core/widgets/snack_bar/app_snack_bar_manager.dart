import 'package:flutter/material.dart';

class AppSnackBarManager {
  AppSnackBarManager._();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
    String message, {
    Color? textColor,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 4),
  }) {
    if (scaffoldMessengerKey.currentState == null) {
      return;
    }

    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: textColor != null ? TextStyle(color: textColor) : null,
        ),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }

  static void hideSnackBar() {
    if (scaffoldMessengerKey.currentState == null) {
      return;
    }
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
