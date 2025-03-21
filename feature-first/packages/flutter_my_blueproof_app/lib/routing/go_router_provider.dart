import 'package:flutter/foundation.dart';
import 'package:flutter_my_blueprint/routing/router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      return state.uri.toString();
    },
  );
}
