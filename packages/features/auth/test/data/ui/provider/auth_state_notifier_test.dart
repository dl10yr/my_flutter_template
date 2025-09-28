import 'package:features_auth/data/repository/provider/auth_repository.dart';
import 'package:features_auth/ui/provider/auth_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_state_notifier_test.mocks.dart';

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

  test('initialize from repository', () async {
    when(mockAuthRepository.fetch()).thenAnswer((_) {
      return 'testToken';
    });

    container.read(authProvider.notifier).initialize();
  });

  test('login from repository', () async {
    when(mockAuthRepository.login('newToken')).thenAnswer((_) {
      return 'newToken';
    });

    container.read(authProvider.notifier).login('newToken');
  });
}
