// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/github_token/github_token_service.dart';

class GithubTokenInterceptor extends QueuedInterceptor {
  final GithubTokenService tokenService;

  GithubTokenInterceptor(this.tokenService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final githubToken = tokenService.fetch();

    if (githubToken == null) {
      return handler.reject(DioException(requestOptions: options));
    }

    options.headers['Authorization'] = "Bearer $githubToken";
    super.onRequest(options, handler);
  }
}
