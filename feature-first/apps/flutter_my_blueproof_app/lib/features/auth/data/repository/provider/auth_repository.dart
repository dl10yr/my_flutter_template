import 'package:flutter_my_blueprint/core/data/service/github_token/provider/github_token_service.dart';
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
  return RemoteAuthRepository(ref.watch(githubTokenServiceProvider));
}

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this.service);
  final GithubTokenService service;

  @override
  String login(String githubToken) {
    service.save(githubToken);
    return githubToken;
  }

  @override
  String? fetch() {
    final githubToken = service.fetch();
    return githubToken;
  }

  @override
  void logout() {
    service.remove();
  }
}
