// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_search_load_more_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(githubRepositorySearchLoadMoreUseCase)
final githubRepositorySearchLoadMoreUseCaseProvider =
    GithubRepositorySearchLoadMoreUseCaseProvider._();

final class GithubRepositorySearchLoadMoreUseCaseProvider
    extends
        $FunctionalProvider<
          GithubRepositorySearchLoadMoreUseCase,
          GithubRepositorySearchLoadMoreUseCase,
          GithubRepositorySearchLoadMoreUseCase
        >
    with $Provider<GithubRepositorySearchLoadMoreUseCase> {
  GithubRepositorySearchLoadMoreUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'githubRepositorySearchLoadMoreUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$githubRepositorySearchLoadMoreUseCaseHash();

  @$internal
  @override
  $ProviderElement<GithubRepositorySearchLoadMoreUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GithubRepositorySearchLoadMoreUseCase create(Ref ref) {
    return githubRepositorySearchLoadMoreUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GithubRepositorySearchLoadMoreUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<GithubRepositorySearchLoadMoreUseCase>(value),
    );
  }
}

String _$githubRepositorySearchLoadMoreUseCaseHash() =>
    r'84ce681b2bc67f3d89df17760322c657969689d1';
