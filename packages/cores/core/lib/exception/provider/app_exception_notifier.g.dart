// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_exception_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppExceptionNotifier)
final appExceptionProvider = AppExceptionNotifierProvider._();

final class AppExceptionNotifierProvider
    extends $NotifierProvider<AppExceptionNotifier, AppException?> {
  AppExceptionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appExceptionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appExceptionNotifierHash();

  @$internal
  @override
  AppExceptionNotifier create() => AppExceptionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppException? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppException?>(value),
    );
  }
}

String _$appExceptionNotifierHash() =>
    r'67261dbe6c52f9c453ee3d9388800177e5edf765';

abstract class _$AppExceptionNotifier extends $Notifier<AppException?> {
  AppException? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppException?, AppException?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppException?, AppException?>,
              AppException?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
