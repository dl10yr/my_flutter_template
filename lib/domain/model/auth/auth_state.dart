// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  AuthState._();
  factory AuthState({required String? githubToken}) = _AuthState;

  bool get isAuthenticated =>
      githubToken != null && (githubToken ?? '').isNotEmpty;
}
