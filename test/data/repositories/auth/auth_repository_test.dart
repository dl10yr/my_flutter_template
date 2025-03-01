// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';
import '../../../../testing/fakes/data/services/fake_github_token_service.dart';

void main() {
  group('AuthRepositoryRemote tests', () {
    late FakeGithubTokenService githubTokenService;
    late RemoteAuthRepository repository;

    setUp(() {
      githubTokenService = FakeGithubTokenService();
      repository = RemoteAuthRepository(githubTokenService);
    });

    test('perform login', () async {
      expect(githubTokenService.githubToken, null);

      final result = repository.login('TOKEN');
      expect(result, AuthState(githubToken: 'TOKEN'));
      expect(githubTokenService.githubToken, 'TOKEN');
    });
  });
}
