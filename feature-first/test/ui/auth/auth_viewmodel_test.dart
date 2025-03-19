import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';
import 'package:flutter_my_blueprint/ui/auth/auth_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_viewmodel_test.mocks.dart';

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
    final authState = AuthState(githubToken: 'testToken');

    when(mockAuthRepository.fetchAuthState()).thenAnswer((_) {
      return authState;
    });

    final authViewModel = container.read(authViewModelProvider.notifier)
      ..initialize();

    expect(authViewModel.state, authState);
  });

  test('login sets state from repository', () async {
    final authState = AuthState(githubToken: 'newToken');
    when(mockAuthRepository.login('newToken')).thenAnswer((_) {
      return authState;
    });

    final authViewModel = container.read(authViewModelProvider.notifier)
      ..login('newToken');

    expect(authViewModel.state, authState);
  });
}
