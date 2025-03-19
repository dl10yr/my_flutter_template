// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/services/api/model/github_repository/github_repository.dart';
// Project imports:
import '../../auth/auth_viewmodel.dart';
import 'github_repository_search_viewmodel.dart';

class GithubRepositorySearchView extends HookConsumerWidget {
  const GithubRepositorySearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textController = useTextEditingController();
    final AsyncValue<GithubRepositorySearchState> asyncState = ref.watch(
      githubRepositorySearchViewModelProvider,
    );
    final ValueNotifier<bool> searchDebounce = useState<bool>(false);

    useEffect(() {
      Future<void> debounceSearch() async {
        if (textController.text.isNotEmpty) {
          searchDebounce.value = true;
          await Future.delayed(const Duration(milliseconds: 500));
          if (textController.text.isNotEmpty) {
            await ref
                .read(githubRepositorySearchViewModelProvider.notifier)
                .search(textController.text);
          }
          searchDebounce.value = false;
        }
      }

      textController.addListener(debounceSearch);
      return () => textController.removeListener(debounceSearch);
    }, <Object?>[textController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
        elevation: 2,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authViewModelProvider.notifier).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Search repositories...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon:
                    searchDebounce.value
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
          ),
          Expanded(
            child: asyncState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (Object error, _) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: $error',
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed:
                              () => ref.refresh(
                                githubRepositorySearchViewModelProvider,
                              ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
              data:
                  (GithubRepositorySearchState state) =>
                      state.repositories.isEmpty
                          ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  textController.text.isEmpty
                                      ? 'Search for GitHub repositories'
                                      : 'No repositories found',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          )
                          : ListView.separated(
                            itemCount: state.repositories.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(height: 1),
                            itemBuilder: (BuildContext context, int index) {
                              final GithubRepository repo =
                                  state.repositories[index];
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    repo.owner.avatarUrl,
                                  ),
                                  backgroundColor: Colors.grey.shade200,
                                ),
                                title: Text(
                                  repo.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 4),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star_border,
                                          size: 16,
                                          color: Colors.amber.shade700,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(repo.stargazersCount.toString()),
                                        const SizedBox(width: 16),
                                        Icon(
                                          Icons.fork_right,
                                          size: 16,
                                          color: Colors.blue.shade700,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(repo.forksCount.toString()),
                                        const SizedBox(width: 16),
                                        Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 16,
                                          color: Colors.purple.shade700,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(repo.watchersCount.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () {
                                  // Navigate to repository details screen
                                },
                              );
                            },
                          ),
            ),
          ),
        ],
      ),
    );
  }
}
