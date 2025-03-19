// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../github_token/github_token_service.dart';

class GithubTokenInterceptor extends QueuedInterceptor {
  GithubTokenInterceptor(this.tokenService);
  final GithubTokenService tokenService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? githubToken = tokenService.fetch();

    if (githubToken == null) {
      return handler.reject(DioException(requestOptions: options));
    }

    options.headers['Authorization'] = 'Bearer $githubToken';
    super.onRequest(options, handler);
  }
}
