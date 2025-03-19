import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_screen.dart';
import 'package:go_router/go_router.dart';

class SearchTabRoute extends GoRouteData {
  const SearchTabRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GithubRepositorySearchScreen();
}
