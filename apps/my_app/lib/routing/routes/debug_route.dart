part of '../go_router_provider.dart';

@TypedGoRoute<DebugRoute>(path: DebugRoute.path, routes: [])
class DebugRoute extends GoRouteData with $DebugRoute {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DebugPage();

  static const path = '/debug';

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
