// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_my_blueprint/ui/auth/auth_viewmodel.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_viewmodel.dart';

class GithubRepositorySearchScreen extends HookConsumerWidget {
  const GithubRepositorySearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(
      authViewModelProvider.select((value) => value.isAuthenticated),
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
    final searchDebounce = useState<bool>(false);

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
    }, [textController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authViewModelProvider.notifier).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                          'Error: ${error.toString()}',
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

class _NotLoggedInView extends HookConsumerWidget {
  const _NotLoggedInView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isLoading = useState(false);
    final obscureText = useState(true);

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Login'), elevation: 0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.code, size: 80, color: Colors.blueGrey),
              const SizedBox(height: 32),
              const Text(
                'Welcome to GitHub Repository Explorer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your GitHub token to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: controller,
                obscureText: obscureText.value,
                decoration: InputDecoration(
                  labelText: 'GitHub Token',
                  hintText: 'Enter your GitHub personal access token',
                  prefixIcon: const Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => obscureText.value = !obscureText.value,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You can create a token in GitHub Settings > Developer settings > Personal access tokens',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      isLoading.value
                          ? null
                          : () async {
                            if (controller.text.isEmpty) return;

                            FocusManager.instance.primaryFocus?.unfocus();
                            isLoading.value = true;

                            try {
                              ref
                                  .read(authViewModelProvider.notifier)
                                  .login(controller.text);
                            } finally {
                              isLoading.value = false;
                            }
                          },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:
                      isLoading.value
                          ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
