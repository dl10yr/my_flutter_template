import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/ui/view/github_repository_search_screen.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/bottom_tab_route.dart';

import 'package:go_router/go_router.dart';

const searchBranch = TypedStatefulShellBranch<BranchSearchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SearchTabRoute>(path: 'search_tab', name: 'search_tab_screen'),
  ],
);

class SearchTabRoute extends GoRouteData {
  const SearchTabRoute();

  static const path = 'settings_tab';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GithubRepositorySearchScreen();
}
