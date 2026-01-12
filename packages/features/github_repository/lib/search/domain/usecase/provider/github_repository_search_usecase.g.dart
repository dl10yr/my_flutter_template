// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_search_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(githubRepositorySearchUseCase)
final githubRepositorySearchUseCaseProvider =
    GithubRepositorySearchUseCaseProvider._();

final class GithubRepositorySearchUseCaseProvider
    extends
        $FunctionalProvider<
          GithubRepositorySearchUseCase,
          GithubRepositorySearchUseCase,
          GithubRepositorySearchUseCase
        >
    with $Provider<GithubRepositorySearchUseCase> {
  GithubRepositorySearchUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'githubRepositorySearchUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$githubRepositorySearchUseCaseHash();

  @$internal
  @override
  $ProviderElement<GithubRepositorySearchUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GithubRepositorySearchUseCase create(Ref ref) {
    return githubRepositorySearchUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GithubRepositorySearchUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GithubRepositorySearchUseCase>(
        value,
      ),
    );
  }
}

String _$githubRepositorySearchUseCaseHash() =>
    r'c7ae8e20ba9488469bd1e1f4c3e292c7cc45d818';
