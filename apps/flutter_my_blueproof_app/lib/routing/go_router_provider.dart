import 'package:cores_core/flavor/app_flavor.dart';
import 'package:cores_core/widgets/bottom_tab/bottom_tab_screen.dart';
import 'package:features_github_repository/search/ui/view/github_repository_search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/features/settings/common/ui/view/settings_screen.dart';
import 'package:flutter_my_blueprint/features/settings/debug/ui/view/debug_screen.dart';
import 'package:flutter_my_blueprint/features/start/ui/view/start_screen.dart';
import 'package:flutter_my_blueprint/features/web_view/ui/web_view_screen.dart';
import 'package:flutter_my_blueprint/routing/transition/custom_slide_transition.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';
part 'package:flutter_my_blueprint/routing/routes/bottom_tab/bottom_tab_route.dart';
part 'package:flutter_my_blueprint/routing/routes/bottom_tab/search/search_branch.dart';
part 'package:flutter_my_blueprint/routing/routes/bottom_tab/settings/settings_branch.dart';
part 'package:flutter_my_blueprint/routing/routes/debug_route.dart';
part 'package:flutter_my_blueprint/routing/routes/start_up_route.dart';

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
