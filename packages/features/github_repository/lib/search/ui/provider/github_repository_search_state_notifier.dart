import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/domain/model/github_repository.dart';
import '../../domain/usecase/provider/github_repository_search_load_more_usecase.dart';
import '../../domain/usecase/provider/github_repository_search_usecase.dart';

part 'github_repository_search_state_notifier.freezed.dart';
part 'github_repository_search_state_notifier.g.dart';

@freezed
class GithubRepositorySearchState with _$GithubRepositorySearchState {
  const factory GithubRepositorySearchState({
    @Default([]) List<GithubRepository> repositories,
    @Default(true) bool incompleteResults,
    @Default(1) int page,
  }) = _GithubRepositorySearchState;
}

@riverpod
class GithubRepositoryStateNotifier extends _$GithubRepositoryStateNotifier {
  @override
  FutureOr<GithubRepositorySearchState> build() {
    return const GithubRepositorySearchState();
  }

  Future<void> search(String searchWord) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(githubRepositorySearchUseCaseProvider)
          .call(searchWord);
      return GithubRepositorySearchState(
        repositories: result.$1,
        page: result.$2,
        incompleteResults: result.$3,
      );
    });
  }

  Future<void> loadMore(String searchWord) async {
    if (state is AsyncError || state is AsyncLoading) {
      return;
    }
    final data = state.value;
    if (data == null) {
      return;
    }

    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(githubRepositorySearchLoadMoreUseCaseProvider)
          .call((searchWord, data.incompleteResults, data.page));
      return GithubRepositorySearchState(
        repositories: result.$1,
        page: result.$2,
        incompleteResults: result.$3,
      );
    });
  }
}
