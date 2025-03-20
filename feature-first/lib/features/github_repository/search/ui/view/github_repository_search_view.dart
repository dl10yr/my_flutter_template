import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_my_blueprint/core/widgets/snack_bar/show_snack_bar.dart';
import 'package:flutter_my_blueprint/features/auth/ui/auth_provider.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/ui/state/github_repository_search_state.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubRepositorySearchView extends HookConsumerWidget {
  const GithubRepositorySearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final asyncState = ref.watch(githubRepositoryStateNotifierProvider);
    final searchDebounce = useState<bool>(false);

    ref.listen(githubRepositoryStateNotifierProvider, (prev, next) {
      if (next is AsyncError) {
        showSnackBar(
          context: context,
          message: next.error.toString(),
          backgroundColor: Colors.red,
        );
      }
    });

    useEffect(() {
      Future<void> debounceSearch() async {
        if (textController.text.isNotEmpty) {
          searchDebounce.value = true;
          await Future<void>.delayed(const Duration(milliseconds: 500));
          if (textController.text.isNotEmpty) {
            await ref
                .read(githubRepositoryStateNotifierProvider.notifier)
                .search(textController.text);
          }
          searchDebounce.value = false;
        }
      }

      textController.addListener(debounceSearch);
      return () => textController.removeListener(debounceSearch);
    }, [textController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
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
                  (error, _) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                githubRepositoryStateNotifierProvider,
                              ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
              data:
                  (state) =>
                      state.repositories.isEmpty
                          ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                (context, index) => const Divider(height: 1),
                            itemBuilder: (BuildContext context, int index) {
                              final repo = state.repositories[index];
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
                                  children: [
                                    const SizedBox(height: 4),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
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
