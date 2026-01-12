// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_dio.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(githubDio)
final githubDioProvider = GithubDioProvider._();

final class GithubDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  GithubDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'githubDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$githubDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return githubDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$githubDioHash() => r'c5a2a4971a2daa6219974199eec58f0ccdc57dd6';
