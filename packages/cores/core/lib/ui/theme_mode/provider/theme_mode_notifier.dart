import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/service/shared_preference/app_shared_prefernce_key.dart';
import '../../../data/service/shared_preference/provider/shared_preference_service.dart';
import 'init_theme_mode.dart';

part 'theme_mode_notifier.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    return ref.watch(initThemeModeProvider);
  }

  Future<ThemeMode> get() async {
    final prefs = ref.read(sharedPreferenceServiceProvider);
    final read = await prefs.read(AppSharedPreferenceKey.themeMode);
    return ThemeMode.values.singleWhere(
      (themeMode) => themeMode.toString() == read,
      orElse: () => ThemeMode.system,
    );
  }

  void save(ThemeMode theme) {
    state = theme;
    final prefs = ref.read(sharedPreferenceServiceProvider);
    unawaited(prefs.save(AppSharedPreferenceKey.themeMode, theme.toString()));
  }
}
