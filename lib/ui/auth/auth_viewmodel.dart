// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  void build() {}

  void login(String githubToken) {
    ref.read(remoteAuthRepositoryProvider).login(githubToken);
  }
}
