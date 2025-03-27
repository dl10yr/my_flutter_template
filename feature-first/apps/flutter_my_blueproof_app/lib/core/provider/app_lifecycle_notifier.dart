import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_notifier.g.dart';

// ref: https://zenn.dev/riscait/books/flutter-riverpod-practical-introduction/viewer/v2-app-lifecycle
@riverpod
class AppLifecycleNotifier extends _$AppLifecycleNotifier
    with WidgetsBindingObserver {
  @override
  AppLifecycleState build() {
    final binding = WidgetsBinding.instance..addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return AppLifecycleState.resumed;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
    super.didChangeAppLifecycleState(state);
  }
}
