import 'package:flutter_my_blueprint/features/auth/data/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';
part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({required String? githubToken}) = _AuthState;
  AuthState._();

  bool get isAuthenticated =>
      githubToken != null && (githubToken ?? '').isNotEmpty;
}

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() => AuthState(githubToken: null);

  void initialize() {
    final token = ref.read(remoteAuthRepositoryProvider).fetch();
    state = AuthState(githubToken: token);
  }

  void login(String githubToken) {
    final token = ref.read(remoteAuthRepositoryProvider).login(githubToken);
    state = AuthState(githubToken: token);
  }

  void logout() {
    ref.read(remoteAuthRepositoryProvider).logout();
    state = AuthState(githubToken: null);
  }
}
