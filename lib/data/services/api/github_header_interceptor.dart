// Package imports:
import 'package:dio/dio.dart';

class GithubHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/vnd.github+json';
    options.headers['X-GitHub-Api-Version'] = '2022-11-28';
    super.onRequest(options, handler);
  }
}
