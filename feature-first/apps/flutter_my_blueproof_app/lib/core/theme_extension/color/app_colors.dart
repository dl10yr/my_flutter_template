import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_colors.g.theme.dart';

@themeExtensions
class AppColors extends ThemeExtension<AppColors> with _$ThemeExtensionMixin {
  const AppColors({required this.hoge});

  factory AppColors.light() => const AppColors(hoge: Color(0xffc7e79e));
  factory AppColors.dark() => const AppColors(hoge: Color(0xff4c662b));

  final Color hoge;
}
