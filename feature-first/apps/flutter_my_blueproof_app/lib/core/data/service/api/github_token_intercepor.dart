import 'package:dio/dio.dart';
import 'package:flutter_my_blueprint/core/data/service/api/github_token/provider/github_token_state_notifier.dart';

class GithubTokenInterceptor extends QueuedInterceptor {
  GithubTokenInterceptor(this.tokenStateNotifier);
  final GithubTokenStateNotifier tokenStateNotifier;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final githubToken = tokenStateNotifier.fetch();

    if (githubToken == null) {
      return handler.reject(DioException(requestOptions: options));
    }

    options.headers['Authorization'] = 'Bearer $githubToken';
    super.onRequest(options, handler);
  }
}
