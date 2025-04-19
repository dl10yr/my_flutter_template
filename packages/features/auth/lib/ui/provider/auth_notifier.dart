import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/provider/auth_repository.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  void build() {}

  void initialize() {
    ref.read(remoteAuthRepositoryProvider).fetch();
  }

  void login(String githubToken) {
    ref.read(remoteAuthRepositoryProvider).login(githubToken);
  }

  void logout() {
    ref.read(remoteAuthRepositoryProvider).logout();
  }
}
