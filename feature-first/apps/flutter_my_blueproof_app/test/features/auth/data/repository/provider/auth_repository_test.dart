import 'package:flutter_my_blueprint/core/data/service/api/github_token/github_token_state.dart';
import 'package:flutter_my_blueprint/core/data/service/api/github_token/provider/github_token_state_notifier.dart';
import 'package:flutter_my_blueprint/features/auth/data/repository/provider/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('AuthRepositoryRemote tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(overrides: []);
    });

    tearDown(() {
      container.dispose();
    });

    test('perform login', () async {
      expect(
        container.read(githubTokenStateNotifierProvider),
        GithubTokenState(),
      );

      final result = container
          .read(remoteAuthRepositoryProvider)
          .login('TOKEN');

      expect(result, 'TOKEN');
      expect(
        container.read(githubTokenStateNotifierProvider),
        GithubTokenState(githubToken: 'TOKEN'),
      );
    });
  });
}
