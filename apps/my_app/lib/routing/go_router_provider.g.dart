// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_provider.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $animatedGridRoute,
  $bottomTabRoute,
  $debugRoute,
  $startUpRoute,
];

RouteBase get $animatedGridRoute => GoRouteData.$route(
  path: '/animated-grid',

  factory: _$AnimatedGridRoute._fromState,
);

mixin _$AnimatedGridRoute on GoRouteData {
  static AnimatedGridRoute _fromState(GoRouterState state) =>
      const AnimatedGridRoute();

  @override
  String get location => GoRouteData.$location('/animated-grid');

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

RouteBase get $bottomTabRoute => StatefulShellRouteData.$route(
  parentNavigatorKey: BottomTabRoute.$parentNavigatorKey,
  factory: $BottomTabRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      navigatorKey: BranchSearchData.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/search_tab',

          factory: _$SearchTabRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      navigatorKey: BranchSettingsData.$navigatorKey,

      routes: [
        GoRouteData.$route(
          path: '/settings_tab',

          factory: _$SettingsTabRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'license',

              factory: _$LicensePageRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'web_view',

              parentNavigatorKey: WebViewPageRoute.$parentNavigatorKey,

              factory: _$WebViewPageRoute._fromState,
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

mixin _$SearchTabRoute on GoRouteData {
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

mixin _$SettingsTabRoute on GoRouteData {
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

mixin _$LicensePageRoute on GoRouteData {
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

mixin _$WebViewPageRoute on GoRouteData {
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

  factory: _$DebugRoute._fromState,
);

mixin _$DebugRoute on GoRouteData {
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

  factory: _$StartUpRoute._fromState,
);

mixin _$StartUpRoute on GoRouteData {
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
