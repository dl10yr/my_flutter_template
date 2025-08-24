import 'package:cores_core/flavor/app_flavor.dart';
import 'package:cores_core/web_view/web_view_page.dart';
import 'package:cores_core/widgets/bottom_tab/bottom_tab_page.dart';
import 'package:features_github_repository/search/ui/view/github_repository_search_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/routing/transition/custom_slide_transition.dart';
import 'package:my_app/ui/view/animated_grid_page.dart';
import 'package:my_app/ui/view/debug_page.dart';
import 'package:my_app/ui/view/settings_page.dart';
import 'package:my_app/ui/view/start_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';
part 'package:my_app/routing/routes/animated_grid_route.dart';
part 'package:my_app/routing/routes/bottom_tab/bottom_tab_route.dart';
part 'package:my_app/routing/routes/bottom_tab/search/search_branch.dart';
part 'package:my_app/routing/routes/bottom_tab/settings/settings_branch.dart';
part 'package:my_app/routing/routes/debug_route.dart';
part 'package:my_app/routing/routes/start_up_route.dart';

/// NavigatorKey
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final searchTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final settingsTabNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'settingsTab',
);

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    routes: [
      ...$appRoutes.where((route) {
        if (route is GoRoute) {
          return route.path != DebugRoute.path;
        }

        return true;
      }),
      if (!isPrd()) $debugRoute,
    ],
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      return state.uri.toString();
    },
  );
}
