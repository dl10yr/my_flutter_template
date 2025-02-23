// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';

// Project imports:

part 'auth_repository.g.dart';

abstract class AuthRepository extends Notifier<AuthState> {
  void login(String githubApiToken);
}

@Riverpod(keepAlive: true)
class RemoteAuthRepository extends _$RemoteAuthRepository
    implements AuthRepository {
  @override
  AuthState build() {
    return AuthState(githubToken: null);
  }

  @override
  void login(String githubToken) {
    state = state.copyWith(githubToken: githubToken);
  }
}
