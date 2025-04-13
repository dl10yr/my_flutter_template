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

          factory: $SearchTabRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: BranchSettingsData.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/settings_tab',

          factory: $SettingsTabRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'license',

              factory: $LicensePageRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'web_view',

              parentNavigatorKey: WebViewPageRoute.$parentNavigatorKey,

              factory: $WebViewPageRouteExtension._fromState,
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

extension $SearchTabRouteExtension on SearchTabRoute {
  static SearchTabRoute _fromState(GoRouterState state) =>
      const SearchTabRoute();

  String get location => GoRouteData.$location('/search_tab');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsTabRouteExtension on SettingsTabRoute {
  static SettingsTabRoute _fromState(GoRouterState state) =>
      const SettingsTabRoute();

  String get location => GoRouteData.$location('/settings_tab');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LicensePageRouteExtension on LicensePageRoute {
  static LicensePageRoute _fromState(GoRouterState state) =>
      const LicensePageRoute();

  String get location => GoRouteData.$location('/settings_tab/license');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WebViewPageRouteExtension on WebViewPageRoute {
  static WebViewPageRoute _fromState(GoRouterState state) =>
      const WebViewPageRoute();

  String get location => GoRouteData.$location('/settings_tab/web_view');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $debugRoute => GoRouteData.$route(
  path: '/debug',

  parentNavigatorKey: DebugRoute.$parentNavigatorKey,

  factory: $DebugRouteExtension._fromState,
);

extension $DebugRouteExtension on DebugRoute {
  static DebugRoute _fromState(GoRouterState state) => const DebugRoute();

  String get location => GoRouteData.$location('/debug');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $startUpRoute => GoRouteData.$route(
  path: '/',

  parentNavigatorKey: StartUpRoute.$parentNavigatorKey,

  factory: $StartUpRouteExtension._fromState,
);

extension $StartUpRouteExtension on StartUpRoute {
  static StartUpRoute _fromState(GoRouterState state) => const StartUpRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'fa79e245399536c8b6df3b776e7e829675f498fd';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = Provider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
