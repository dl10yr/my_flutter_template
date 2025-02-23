// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_load_more_usecase.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_usecase.dart';

// Project imports:

part 'github_repository_search_view_model.freezed.dart';
part 'github_repository_search_view_model.g.dart';

@freezed
class GithubRepositorySearchState with _$GithubRepositorySearchState {
  const factory GithubRepositorySearchState({
    @Default([]) List<GithubRepository> repositories,
    @Default(true) bool imcompleteResults,
    @Default(1) int page,
  }) = _GithubRepositorySearchState;
}

@riverpod
class GithubRepositorySearchViewModel
    extends _$GithubRepositorySearchViewModel {
  @override
  Future<GithubRepositorySearchState> build() async {
    return GithubRepositorySearchState(repositories: []);
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
        imcompleteResults: result.$3,
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
          .call((searchWord, data.imcompleteResults, data.page));
      return GithubRepositorySearchState(
        repositories: result.$1,
        page: result.$2,
        imcompleteResults: result.$3,
      );
    });
  }
}
