part of '../../../go_router_provider.dart';

const searchBranch = TypedStatefulShellBranch<BranchSearchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SearchTabRoute>(path: SearchTabRoute.path),
  ],
);

class SearchTabRoute extends GoRouteData {
  const SearchTabRoute();

  static const path = '/search_tab';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GithubRepositorySearchPage();
}
