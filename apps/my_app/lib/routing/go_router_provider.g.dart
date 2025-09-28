// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_provider.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$bottomTabRoute, $debugRoute, $startUpRoute];

RouteBase get $bottomTabRoute => StatefulShellRouteData.$route(
  parentNavigatorKey: BottomTabRoute.$parentNavigatorKey,
  factory: $BottomTabRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: BranchSearchData.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/search_tab',
          factory: $SearchTabRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: BranchSettingsData.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/settings_tab',
          factory: $SettingsTabRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'license',
              factory: $LicensePageRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'web_view',
              parentNavigatorKey: WebViewPageRoute.$parentNavigatorKey,
              factory: $WebViewPageRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $BottomTabRouteExtension on BottomTabRoute {
  static BottomTabRoute _fromState(GoRouterState state) =>
      const BottomTabRoute();
}

mixin $SearchTabRoute on GoRouteData {
  static SearchTabRoute _fromState(GoRouterState state) =>
      const SearchTabRoute();

  @override
  String get location => GoRouteData.$location('/search_tab');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsTabRoute on GoRouteData {
  static SettingsTabRoute _fromState(GoRouterState state) =>
      const SettingsTabRoute();

  @override
  String get location => GoRouteData.$location('/settings_tab');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LicensePageRoute on GoRouteData {
  static LicensePageRoute _fromState(GoRouterState state) =>
      const LicensePageRoute();

  @override
  String get location => GoRouteData.$location('/settings_tab/license');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WebViewPageRoute on GoRouteData {
  static WebViewPageRoute _fromState(GoRouterState state) =>
      const WebViewPageRoute();

  @override
  String get location => GoRouteData.$location('/settings_tab/web_view');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $debugRoute => GoRouteData.$route(
  path: '/debug',
  parentNavigatorKey: DebugRoute.$parentNavigatorKey,
  factory: $DebugRoute._fromState,
);

mixin $DebugRoute on GoRouteData {
  static DebugRoute _fromState(GoRouterState state) => const DebugRoute();

  @override
  String get location => GoRouteData.$location('/debug');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $startUpRoute => GoRouteData.$route(
  path: '/',
  parentNavigatorKey: StartUpRoute.$parentNavigatorKey,
  factory: $StartUpRoute._fromState,
);

mixin $StartUpRoute on GoRouteData {
  static StartUpRoute _fromState(GoRouterState state) => const StartUpRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(goRouter)
const goRouterProvider = GoRouterProvider._();

final class GoRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  const GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return goRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$goRouterHash() => r'fa79e245399536c8b6df3b776e7e829675f498fd';
