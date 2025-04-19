import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../github_token_state.dart';

part 'github_token_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class GithubTokenStateNotifier extends _$GithubTokenStateNotifier {
  @override
  GithubTokenState build() => GithubTokenState();

  String? _githubToken;
  String? get githubToken => _githubToken;

  void save(String githubToken) {
    _githubToken = githubToken;
    state = GithubTokenState(githubToken: githubToken);
  }

  void remove() {
    _githubToken = null;
    state = GithubTokenState();
  }

  String? fetch() {
    return _githubToken;
  }
}
