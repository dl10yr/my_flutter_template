// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<AppColors> {
  @override
  ThemeExtension<AppColors> copyWith({Color? hoge}) {
    final object = this as AppColors;

    return AppColors(hoge: hoge ?? object.hoge);
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    final otherValue = other;

    if (otherValue is! AppColors) {
      return this;
    }

    final value = this as AppColors;

    return AppColors(hoge: Color.lerp(value.hoge, otherValue.hoge, t)!);
  }

  @override
  bool operator ==(Object other) {
    final value = this as AppColors;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            identical(value.hoge, other.hoge));
  }

  @override
  int get hashCode {
    final value = this as AppColors;

    return Object.hash(runtimeType, value.hoge);
  }
}

extension AppColorsBuildContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
