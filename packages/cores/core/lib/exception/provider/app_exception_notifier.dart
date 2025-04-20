import 'package:cores_core/exception/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_exception_notifier.g.dart';

// ref: https://github.com/yumemi-inc/flutter-mobile-project-template/blob/main/packages/cores/core/lib/src/exception/provider/app_exception_notifier_provider.dart
@Riverpod(keepAlive: true)
class AppExceptionNotifier extends _$AppExceptionNotifier {
  @override
  AppException? build() => null;

  void notify(AppException exception) {
    state = exception;
  }

  void consume() {
    if (state == null) return;
    state = null;
  }
}
