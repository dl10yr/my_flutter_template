// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_loading_indicator_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLoadingIndicatorNotifier)
const appLoadingIndicatorProvider = AppLoadingIndicatorNotifierProvider._();

final class AppLoadingIndicatorNotifierProvider
    extends $NotifierProvider<AppLoadingIndicatorNotifier, bool> {
  const AppLoadingIndicatorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLoadingIndicatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLoadingIndicatorNotifierHash();

  @$internal
  @override
  AppLoadingIndicatorNotifier create() => AppLoadingIndicatorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appLoadingIndicatorNotifierHash() =>
    r'45b917ed5d9d44a5b532b5314e37daabdf04248d';

abstract class _$AppLoadingIndicatorNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
