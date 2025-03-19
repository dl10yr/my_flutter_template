// Package imports:
// Project imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/services/api/model/github_repository/github_repository.dart';
import '../../../domain/usecase/github_repository/search/github_repository_search_load_more_usecase.dart';
import '../../../domain/usecase/github_repository/search/github_repository_search_usecase.dart';

// Project imports:

part 'github_repository_search_viewmodel.freezed.dart';
part 'github_repository_search_viewmodel.g.dart';

@freezed
class GithubRepositorySearchState with _$GithubRepositorySearchState {
  const factory GithubRepositorySearchState({
    @Default(<GithubRepository>[]) List<GithubRepository> repositories,
    @Default(true) bool incompleteResults,
    @Default(1) int page,
  }) = _GithubRepositorySearchState;
}

@riverpod
class GithubRepositorySearchViewModel
    extends _$GithubRepositorySearchViewModel {
  @override
  FutureOr<GithubRepositorySearchState> build() {
    return const GithubRepositorySearchState();
  }

  Future<void> search(String searchWord) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final (List<GithubRepository>, int, bool) result = await ref
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
    final GithubRepositorySearchState? data = state.value;
    if (data == null) {
      return;
    }

    state = await AsyncValue.guard(() async {
      final (List<GithubRepository>, int, bool) result = await ref
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
