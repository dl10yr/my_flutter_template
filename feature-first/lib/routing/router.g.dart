// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$startUpRoute];

RouteBase get $startUpRoute => GoRouteData.$route(
  path: '/',

  parentNavigatorKey: StartUpRoute.$parentNavigatorKey,

  factory: $StartUpRouteExtension._fromState,
  routes: [
    StatefulShellRouteData.$route(
      parentNavigatorKey: BottomTabRoute.$parentNavigatorKey,
      restorationScopeId: BottomTabRoute.$restorationScopeId,
      factory: $BottomTabRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: BranchSearchData.$navigatorKey,
          restorationScopeId: BranchSearchData.$restorationScopeId,

          routes: [
            GoRouteData.$route(
              path: 'search_tab',
              name: 'search_tab_screen',

              factory: $SearchTabRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: BranchSettingsData.$navigatorKey,
          restorationScopeId: BranchSettingsData.$restorationScopeId,

          routes: [
            GoRouteData.$route(
              path: 'settings_tab',
              name: 'settings_tab_screen',

              factory: $SettingsTabRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
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
