import 'package:flutter/material.dart';

class GridItem {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final String? lottie;

  const GridItem({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    this.lottie,
  });

  GridItem copyWith({
    String? title,
    String? subtitle,
    Color? color,
    IconData? icon,
    String? lottie,
  }) {
    return GridItem(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      lottie: lottie ?? this.lottie,
    );
  }
}