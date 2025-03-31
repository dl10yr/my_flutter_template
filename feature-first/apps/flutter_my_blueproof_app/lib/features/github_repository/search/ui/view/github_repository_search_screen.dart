import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/data/service/api/github_token/provider/github_token_notifier.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/ui/view/github_repository_search_login_view.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/ui/view/github_repository_search_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepositorySearchScreen extends HookConsumerWidget {
  const GithubRepositorySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
      githubTokenStateNotifierProvider.select((value) => value.isAuthenticated),
    );

    if (isAuthenticated) {
      return const GithubRepositorySearchView();
    } else {
      return const GithubRepositorySearchLoginView();
    }
  }
}
