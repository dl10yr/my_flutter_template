import 'package:dio/dio.dart';

import 'package:flutter_my_blueprint/core/data/service/github_token/provider/github_token_service.dart';

class GithubTokenInterceptor extends QueuedInterceptor {
  GithubTokenInterceptor(this.tokenService);
  final GithubTokenService tokenService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final githubToken = tokenService.fetch();

    if (githubToken == null) {
      return handler.reject(DioException(requestOptions: options));
    }

    options.headers['Authorization'] = 'Bearer $githubToken';
    super.onRequest(options, handler);
  }
}
