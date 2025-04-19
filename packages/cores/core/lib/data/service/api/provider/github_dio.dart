import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../error_interceptor.dart';
import '../github_header_interceptor.dart';
import '../github_token/provider/github_token_state_notifier.dart';
import '../github_token_intercepor.dart';

part 'github_dio.g.dart';

@Riverpod(keepAlive: true)
Dio githubDio(Ref ref) {
  return GithubDio.getInstance(
    ref.watch(githubTokenStateNotifierProvider.notifier),
  );
}

class GithubDio with DioMixin implements Dio {
  GithubDio._(
    GithubTokenStateNotifier tokenStateNotifier, [
    BaseOptions? options,
  ]) {
    options = BaseOptions(
      baseUrl: 'https://api.github.com',
      contentType: Headers.jsonContentType,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    this.options = options;

    interceptors
      ..add(ErrorInterceptor())
      ..add(GithubHeaderInterceptor())
      ..add(GithubTokenInterceptor(tokenStateNotifier));

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance(GithubTokenStateNotifier tokenStateNotifier) =>
      GithubDio._(tokenStateNotifier);
}
