// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preference_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferenceService)
final sharedPreferenceServiceProvider = SharedPreferenceServiceProvider._();

final class SharedPreferenceServiceProvider
    extends
        $FunctionalProvider<
          SharedPreferenceService,
          SharedPreferenceService,
          SharedPreferenceService
        >
    with $Provider<SharedPreferenceService> {
  SharedPreferenceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferenceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferenceServiceHash();

  @$internal
  @override
  $ProviderElement<SharedPreferenceService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferenceService create(Ref ref) {
    return sharedPreferenceService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferenceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferenceService>(value),
    );
  }
}

String _$sharedPreferenceServiceHash() =>
    r'9921e858e947c7dc540c2078dca879d69289b788';
