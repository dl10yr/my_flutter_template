// Package imports:
import 'package:dio/dio.dart';

class GithubTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = "Bearer ";
    super.onRequest(options, handler);
  }
}
