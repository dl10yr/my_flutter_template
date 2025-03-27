import 'package:async/async.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_loading_indicator_notifier.g.dart';

@riverpod
class AppLoadingIndicatorNotifier extends _$AppLoadingIndicatorNotifier {
  @override
  bool build() => false;

  final asyncCache = AsyncCache<dynamic>.ephemeral();

  Future<T> show<T>(Future<T> Function() future) async {
    return await asyncCache.fetch(() async {
          try {
            state = true;
            final result = await future();
            state = false;
            return result;
          } catch (e) {
            state = false;
            rethrow;
          }
        })
        as T;
  }
}
