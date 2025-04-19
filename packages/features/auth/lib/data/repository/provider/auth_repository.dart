import 'package:cores_core/data/service/api/github_token/provider/github_token_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  String login(String githubApiToken);
  void logout();
  String? fetch();
}

@riverpod
AuthRepository remoteAuthRepository(Ref ref) {
  return RemoteAuthRepository(
    ref.watch(githubTokenStateNotifierProvider.notifier),
  );
}

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this.tokenStateNotifier);
  final GithubTokenStateNotifier tokenStateNotifier;

  @override
  String login(String githubToken) {
    tokenStateNotifier.save(githubToken);
    return githubToken;
  }

  @override
  String? fetch() {
    final githubToken = tokenStateNotifier.fetch();
    return githubToken;
  }

  @override
  void logout() {
    tokenStateNotifier.remove();
  }
}
