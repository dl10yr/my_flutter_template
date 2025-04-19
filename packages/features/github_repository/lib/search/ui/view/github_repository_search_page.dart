import 'package:cores_core/data/service/api/github_token/provider/github_token_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'github_repository_search_login_view.dart';
import 'github_repository_search_view.dart';

class GithubRepositorySearchPage extends HookConsumerWidget {
  const GithubRepositorySearchPage({super.key});

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
