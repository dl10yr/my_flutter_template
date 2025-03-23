import 'package:flutter_my_blueprint/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_my_blueprint/features/auth/ui/auth_provider.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_provider_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late ProviderContainer container;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    container = ProviderContainer(
      overrides: [
        remoteAuthRepositoryProvider.overrideWithValue(mockAuthRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initialize sets state from repository', () async {
    when(mockAuthRepository.fetch()).thenAnswer((_) {
      return 'testToken';
    });

    final authViewModel = container.read(authProvider.notifier)..initialize();

    expect(authViewModel.state, AuthState(githubToken: 'testToken'));
  });

  test('login sets state from repository', () async {
    when(mockAuthRepository.login('newToken')).thenAnswer((_) {
      return 'newToken';
    });

    final authViewModel = container.read(authProvider.notifier)
      ..login('newToken');

    expect(authViewModel.state, AuthState(githubToken: 'newToken'));
  });
}
