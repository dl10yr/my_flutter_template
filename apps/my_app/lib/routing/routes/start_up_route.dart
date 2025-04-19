part of '../go_router_provider.dart';

/// TypedGoRoute
@TypedGoRoute<StartUpRoute>(path: '/', routes: [])
class StartUpRoute extends GoRouteData {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
