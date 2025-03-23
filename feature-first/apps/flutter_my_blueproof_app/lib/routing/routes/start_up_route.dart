import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/features/start/ui/view/start_screen.dart';
import 'package:flutter_my_blueprint/routing/go_router_provider.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/bottom_tab_route.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/search/search_branch.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/settings/settings_branch.dart';
import 'package:go_router/go_router.dart';

part 'start_up_route.g.dart';

/// TypedGoRoute
@TypedGoRoute<StartUpRoute>(
  path: '/',
  routes: [
    TypedStatefulShellRoute<BottomTabRoute>(
      branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
        searchBranch,
        settingsBranch,
      ],
    ),
  ],
)
class StartUpRoute extends GoRouteData {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartScreen();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
