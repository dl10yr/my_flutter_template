import 'package:flutter_my_blueprint/data/services/github_token/github_token_service.dart';

class FakeGithubTokenService implements GithubTokenService {
  FakeGithubTokenService();

  String? _githubToken;

  @override
  String? get githubToken => _githubToken;

  @override
  void save(String githubToken) {
    _githubToken = githubToken;
  }

  @override
  String? fetch() {
    return _githubToken;
  }

  @override
  void remove() {
    _githubToken = null;
  }
}
