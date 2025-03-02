// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_token_service.g.dart';

@Riverpod(keepAlive: true)
GithubTokenService githubTokenService(Ref ref) {
  return GithubTokenService();
}

class GithubTokenService {
  GithubTokenService();

  String? _githubToken;
  String? get githubToken => _githubToken;

  void save(String githubToken) {
    _githubToken = githubToken;
  }

  void remove() {
    _githubToken = null;
  }

  String? fetch() {
    return _githubToken;
  }
}
