import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/features/settings/ui/view/settings_screen.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/bottom_tab_route.dart';
import 'package:flutter_my_blueprint/routing/transition/custom_slide_transition.dart';
import 'package:go_router/go_router.dart';

const settingsBranch = TypedStatefulShellBranch<BranchSettingsData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingsTabRoute>(
      path: SettingsTabRoute.path,
      routes: [TypedGoRoute<LicensePageRoute>(path: LicensePageRoute.path)],
    ),
  ],
);

class SettingsTabRoute extends GoRouteData {
  const SettingsTabRoute();

  static const path = 'settings_tab';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}

class LicensePageRoute extends GoRouteData {
  const LicensePageRoute();

  static const path = 'license';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomSlideTransition(child: const LicensePage());
  }
}
