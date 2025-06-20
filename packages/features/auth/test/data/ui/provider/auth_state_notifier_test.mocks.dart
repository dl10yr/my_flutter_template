// Mocks generated by Mockito 5.4.6 from annotations
// in features_auth/test/data/ui/provider/auth_state_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:features_auth/data/repository/provider/auth_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i2.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String login(String? githubApiToken) =>
      (super.noSuchMethod(
            Invocation.method(#login, [githubApiToken]),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.method(#login, [githubApiToken]),
            ),
          )
          as String);

  @override
  void logout() => super.noSuchMethod(
    Invocation.method(#logout, []),
    returnValueForMissingStub: null,
  );
}
