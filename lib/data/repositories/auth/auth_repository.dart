// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/github_token/github_token_service.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';

// Project imports:

part 'auth_repository.g.dart';

abstract class AuthRepository {
  void login(String githubApiToken);
}

@riverpod
RemoteAuthRepository remoteAuthRepository(Ref ref) {
  return RemoteAuthRepository(
    ref.watch(githubTokenServiceProvider),
    ref.watch(githubTokenServiceProvider.notifier),
  );
}

class RemoteAuthRepository implements AuthRepository {
  final String? githubToken;
  final GithubTokenService service;

  RemoteAuthRepository(this.githubToken, this.service);

  AuthState get authState => AuthState(githubToken: githubToken);

  @override
  void login(String githubToken) {
    service.save(githubToken);
  }
}
