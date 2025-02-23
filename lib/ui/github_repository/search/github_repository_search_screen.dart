// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_view_model.dart';

// Package imports:

class GithubRepositorySearchScreen extends HookConsumerWidget {
  const GithubRepositorySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(
      githubRepositorySearchViewModelProvider.select(
        (value) => value.repositories,
      ),
    );

    final textController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
              itemCount: repositories.length,
              itemBuilder: (BuildContext context, int index) {
                final item = repositories[index];
                return ListTile(title: Text(item.name), onTap: () {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
