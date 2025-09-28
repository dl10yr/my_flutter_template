// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_search_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GithubRepositoryStateNotifier)
const githubRepositoryStateProvider = GithubRepositoryStateNotifierProvider._();

final class GithubRepositoryStateNotifierProvider
    extends
        $AsyncNotifierProvider<
          GithubRepositoryStateNotifier,
          GithubRepositorySearchState
        > {
  const GithubRepositoryStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'githubRepositoryStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$githubRepositoryStateNotifierHash();

  @$internal
  @override
  GithubRepositoryStateNotifier create() => GithubRepositoryStateNotifier();
}

String _$githubRepositoryStateNotifierHash() =>
    r'c059651b2f1008de0ff77f0a584d4ab9ab05717b';

abstract class _$GithubRepositoryStateNotifier
    extends $AsyncNotifier<GithubRepositorySearchState> {
  FutureOr<GithubRepositorySearchState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<GithubRepositorySearchState>,
              GithubRepositorySearchState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<GithubRepositorySearchState>,
                GithubRepositorySearchState
              >,
              AsyncValue<GithubRepositorySearchState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
