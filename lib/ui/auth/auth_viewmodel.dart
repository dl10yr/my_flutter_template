import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() => AuthState(githubToken: null);

  void initialize() {
    final authState = ref.read(remoteAuthRepositoryProvider).fetchAuthState();
    state = authState;
  }

  void login(String githubToken) {
    final authState = ref.read(remoteAuthRepositoryProvider).login(githubToken);
    state = authState;
  }

  void logout() {
    ref.read(remoteAuthRepositoryProvider).logout();
    state = AuthState(githubToken: null);
  }
}
