// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_my_blueprint/ui/auth/auth_state_provider.dart';
import 'package:flutter_my_blueprint/ui/auth/auth_viewmodel.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_view_model.dart';

// Package imports:

class GithubRepositorySearchScreen extends HookConsumerWidget {
  const GithubRepositorySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
      authStateProvider.select((value) => value.isAuthenticated),
    );

    if (isAuthenticated) {
      return const _SearchView();
    } else {
      return const _NotLoggedInView();
    }
  }
}

class _SearchView extends HookConsumerWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    final asyncState = ref.watch(githubRepositorySearchViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: asyncState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data:
            (state) => Column(
              children: [
                TextField(
                  decoration: const InputDecoration(hintText: 'Search'),
                  controller: textController,
                  onChanged: (value) async {
                    await ref
                        .read(githubRepositorySearchViewModelProvider.notifier)
                        .search(value);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.repositories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.repositories[index];
                      return ListTile(title: Text(item.name), onTap: () {});
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

class _NotLoggedInView extends HookConsumerWidget {
  const _NotLoggedInView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('GithubTokenを入力してください'),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter Github Token'),
            ),
            ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                ref.read(authViewModelProvider.notifier).login(controller.text);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
