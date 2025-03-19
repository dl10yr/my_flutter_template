import 'package:flutter/material.dart';

import 'package:flutter_my_blueprint/ui/auth/auth_viewmodel.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_login_view.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_view.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepositorySearchScreen extends HookConsumerWidget {
  const GithubRepositorySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
      authViewModelProvider.select((value) => value.isAuthenticated),
    );

    if (isAuthenticated) {
      return const GithubRepositorySearchView();
    } else {
      return const GithubRepositorySearchLoginView();
    }
  }
}
