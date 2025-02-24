// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/github_token/github_token_service.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';

// Project imports:

part 'auth_repository.g.dart';

abstract class AuthRepository {
  AuthState login(String githubApiToken);
  AuthState fetchAuthState();
}

@riverpod
AuthRepository remoteAuthRepository(Ref ref) {
  return RemoteAuthRepository(ref.watch(githubTokenServiceProvider));
}

class RemoteAuthRepository implements AuthRepository {
  final GithubTokenService service;

  RemoteAuthRepository(this.service);

  @override
  AuthState login(String githubToken) {
    service.save(githubToken);
    return AuthState(githubToken: githubToken);
  }

  @override
  AuthState fetchAuthState() {
    final githubToken = service.fetch();
    return AuthState(githubToken: githubToken);
  }
}
