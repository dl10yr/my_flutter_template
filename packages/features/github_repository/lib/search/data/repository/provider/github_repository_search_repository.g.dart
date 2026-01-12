// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteGithubSearchRepositoryRepository)
final remoteGithubSearchRepositoryRepositoryProvider =
    RemoteGithubSearchRepositoryRepositoryProvider._();

final class RemoteGithubSearchRepositoryRepositoryProvider
    extends
        $FunctionalProvider<
          GithubRepositorySearchRepository,
          GithubRepositorySearchRepository,
          GithubRepositorySearchRepository
        >
    with $Provider<GithubRepositorySearchRepository> {
  RemoteGithubSearchRepositoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteGithubSearchRepositoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$remoteGithubSearchRepositoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<GithubRepositorySearchRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GithubRepositorySearchRepository create(Ref ref) {
    return remoteGithubSearchRepositoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GithubRepositorySearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GithubRepositorySearchRepository>(
        value,
      ),
    );
  }
}

String _$remoteGithubSearchRepositoryRepositoryHash() =>
    r'4bea6e63e287c69a560a4e2518b959937fbc1e87';
