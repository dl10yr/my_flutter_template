// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/domain/model/auth/auth_state.dart';

part 'auth_state_provider.g.dart';

@riverpod
AuthState authState(Ref ref) {
  return ref.watch(remoteAuthRepositoryProvider).authState;
}
