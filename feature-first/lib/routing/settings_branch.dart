import 'package:flutter_my_blueprint/routing/bottom_tab_route.dart';
import 'package:flutter_my_blueprint/routing/settings_tab_route.dart';
import 'package:go_router/go_router.dart';

const settingsBranch = TypedStatefulShellBranch<BranchSettingsData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingsTabRoute>(
      path: 'settings_tab',
      name: 'settings_tab_screen',
    ),
  ],
);
