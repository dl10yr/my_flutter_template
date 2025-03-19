// Package imports:
// Project imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth/auth_repository.dart';
import '../../domain/model/auth/auth_state.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() => AuthState(githubToken: null);

  void initialize() {
    final AuthState authState =
        ref.read(remoteAuthRepositoryProvider).fetchAuthState();
    state = authState;
  }

  void login(String githubToken) {
    final AuthState authState = ref
        .read(remoteAuthRepositoryProvider)
        .login(githubToken);
    state = authState;
  }

  void logout() {
    ref.read(remoteAuthRepositoryProvider).logout();
    state = AuthState(githubToken: null);
  }
}
