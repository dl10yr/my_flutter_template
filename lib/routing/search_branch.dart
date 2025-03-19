import 'package:flutter_my_blueprint/routing/bottom_tab_route.dart';
import 'package:flutter_my_blueprint/routing/search_tab_route.dart';
import 'package:go_router/go_router.dart';

const searchBranch = TypedStatefulShellBranch<BranchSearchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SearchTabRoute>(path: 'search_tab', name: 'search_tab_screen'),
  ],
);
