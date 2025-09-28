import 'package:flutter/material.dart';

/// ThemeExtension without code generation.
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.hoge});

  /// Light theme palette
  factory AppColors.light() => const AppColors(hoge: Color(0xffc7e79e));

  /// Dark theme palette
  factory AppColors.dark() => const AppColors(hoge: Color(0xff4c662b));

  final Color hoge;

  @override
  AppColors copyWith({Color? hoge}) {
    return AppColors(hoge: hoge ?? this.hoge);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(hoge: Color.lerp(hoge, other.hoge, t) ?? hoge);
  }

  @override
  int get hashCode => Object.hash(runtimeType, hoge);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is AppColors &&
          other.hoge == hoge);
}

extension AppColorsBuildContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
