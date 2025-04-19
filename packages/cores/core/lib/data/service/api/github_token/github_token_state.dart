import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_token_state.freezed.dart';

@freezed
class GithubTokenState with _$GithubTokenState {
  factory GithubTokenState({String? githubToken}) = _GithubTokenState;
  GithubTokenState._();

  bool get isAuthenticated => githubToken != null;
}
