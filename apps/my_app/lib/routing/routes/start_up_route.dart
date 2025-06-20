part of '../go_router_provider.dart';

/// TypedGoRoute
@TypedGoRoute<StartUpRoute>(path: '/', routes: [])
class StartUpRoute extends GoRouteData with _$StartUpRoute {
  const StartUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}
