// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/model/auth/auth_state.dart';
// Project imports:
import '../../auth/auth_viewmodel.dart';
import 'github_repository_search_login_view.dart';
import 'github_repository_search_view.dart';

class GithubRepositorySearchScreen extends HookConsumerWidget {
  const GithubRepositorySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isAuthenticated = ref.watch(
      authViewModelProvider.select((AuthState value) => value.isAuthenticated),
    );

    if (isAuthenticated) {
      return const GithubRepositorySearchView();
    } else {
      return const GithubRepositorySearchLoginView();
    }
  }
}
