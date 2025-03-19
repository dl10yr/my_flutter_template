// Package imports:
// Project imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/auth/auth_state.dart';
import '../../services/github_token/github_token_service.dart';

// Project imports:

part 'auth_repository.g.dart';

abstract class AuthRepository {
  AuthState login(String githubApiToken);
  void logout();
  AuthState fetchAuthState();
}

@riverpod
AuthRepository remoteAuthRepository(Ref ref) {
  return RemoteAuthRepository(ref.watch(githubTokenServiceProvider));
}

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this.service);
  final GithubTokenService service;

  @override
  AuthState login(String githubToken) {
    service.save(githubToken);
    return AuthState(githubToken: githubToken);
  }

  @override
  AuthState fetchAuthState() {
    final String? githubToken = service.fetch();
    return AuthState(githubToken: githubToken);
  }

  @override
  void logout() {
    service.remove();
  }
}
