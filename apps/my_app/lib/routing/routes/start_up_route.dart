part of '../go_router_provider.dart';

/// TypedGoRoute
@TypedGoRoute<StartUpRoute>(path: '/')
class StartUpRoute extends GoRouteData with $StartUpRoute {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
