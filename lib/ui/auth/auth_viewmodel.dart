// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  AuthState build() => AuthState(githubToken: null);

  void login(String githubToken) {
    final authState = ref.read(remoteAuthRepositoryProvider).login(githubToken);
    state = authState;
  }
}
