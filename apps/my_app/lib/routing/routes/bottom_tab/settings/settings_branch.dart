part of '../../../go_router_provider.dart';

const settingsBranch = TypedStatefulShellBranch<BranchSettingsData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingsTabRoute>(
      path: SettingsTabRoute.path,
      routes: [
        TypedGoRoute<LicensePageRoute>(path: LicensePageRoute.path),
        TypedGoRoute<WebViewPageRoute>(path: WebViewPageRoute.path),
      ],
    ),
  ],
);

class SettingsTabRoute extends GoRouteData {
  const SettingsTabRoute();

  static const path = '/settings_tab';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

class LicensePageRoute extends GoRouteData {
  const LicensePageRoute();

  static const path = 'license';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomSlideTransition(child: const LicensePage());
  }
}

class WebViewPageRoute extends GoRouteData {
  const WebViewPageRoute();

  static const path = 'web_view';

  static final $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return WebViewPage(
      initialUrl: Uri.parse('https://flutter.dev'),
      pop: () {
        print('pop');
      },
    );
  }
}
