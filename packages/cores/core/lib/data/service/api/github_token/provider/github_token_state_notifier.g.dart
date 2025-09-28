// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_token_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GithubTokenStateNotifier)
const githubTokenStateProvider = GithubTokenStateNotifierProvider._();

final class GithubTokenStateNotifierProvider
    extends $NotifierProvider<GithubTokenStateNotifier, GithubTokenState> {
  const GithubTokenStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'githubTokenStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$githubTokenStateNotifierHash();

  @$internal
  @override
  GithubTokenStateNotifier create() => GithubTokenStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GithubTokenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GithubTokenState>(value),
    );
  }
}

String _$githubTokenStateNotifierHash() =>
    r'ae32486c234e0fffd3bd79cccc89b9a1f99f4065';

abstract class _$GithubTokenStateNotifier extends $Notifier<GithubTokenState> {
  GithubTokenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GithubTokenState, GithubTokenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GithubTokenState, GithubTokenState>,
              GithubTokenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
