// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lifecycle_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLifecycleNotifier)
final appLifecycleProvider = AppLifecycleNotifierProvider._();

final class AppLifecycleNotifierProvider
    extends $NotifierProvider<AppLifecycleNotifier, AppLifecycleState> {
  AppLifecycleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLifecycleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLifecycleNotifierHash();

  @$internal
  @override
  AppLifecycleNotifier create() => AppLifecycleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLifecycleState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLifecycleState>(value),
    );
  }
}

String _$appLifecycleNotifierHash() =>
    r'2f2dfd3437f136565364392bb81d13003da79ecf';

abstract class _$AppLifecycleNotifier extends $Notifier<AppLifecycleState> {
  AppLifecycleState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppLifecycleState, AppLifecycleState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLifecycleState, AppLifecycleState>,
              AppLifecycleState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
