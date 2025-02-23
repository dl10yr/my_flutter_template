// Package imports:
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/api/error_interceptor.dart';
import 'package:flutter_my_blueprint/data/services/api/github_header_interceptor.dart';
import 'package:flutter_my_blueprint/data/services/api/github_token_intercepor.dart';

part 'github_dio.g.dart';

@Riverpod(keepAlive: true)
Dio githubDio(Ref ref) {
  return GithubDio.getInstance();
}

class GithubDio with DioMixin implements Dio {
  GithubDio._([BaseOptions? options]) {
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
    interceptors.add(GithubTokenInterceptor());

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance() => GithubDio._();
}
