// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/api/error_interceptor.dart';
import 'package:flutter_my_blueprint/data/services/api/github_header_interceptor.dart';
import 'package:flutter_my_blueprint/data/services/api/github_token_intercepor.dart';
import 'package:flutter_my_blueprint/data/services/github_token/github_token_service.dart';

part 'github_dio.g.dart';

@Riverpod(keepAlive: true)
Dio githubDio(Ref ref) {
  return GithubDio.getInstance(ref.watch(githubTokenServiceProvider.notifier));
}

class GithubDio with DioMixin implements Dio {
  GithubDio._(GithubTokenService tokenService, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: 'https://api.github.com',
      contentType: Headers.jsonContentType,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    this.options = options;

    interceptors.add(ErrorInterceptor());
    interceptors.add(GithubHeaderInterceptor());
    interceptors.add(GithubTokenInterceptor(tokenService));

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance(GithubTokenService tokenService) =>
      GithubDio._(tokenService);
}
