// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_token_service.g.dart';

@Riverpod(keepAlive: true)
class GithubTokenService extends _$GithubTokenService {
  @override
  String? build() {
    return null;
  }

  void save(String githubToken) {
    state = githubToken;
  }

  String? fetch() {
    return state;
  }
}
