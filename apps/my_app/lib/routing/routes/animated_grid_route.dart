part of '../go_router_provider.dart';

@TypedGoRoute<AnimatedGridRoute>(
  path: '/animated-grid',
)
class AnimatedGridRoute extends GoRouteData with _$AnimatedGridRoute {
  const AnimatedGridRoute();
  
  static const path = '/animated-grid';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AnimatedGridPage();
}