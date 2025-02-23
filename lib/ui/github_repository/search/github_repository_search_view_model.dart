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
  GithubRepositorySearchState build() =>
      const GithubRepositorySearchState(repositories: []);

  Future<void> search(String searchWord) async {
    try {
      final result = await ref
          .read(githubRepositorySearchUseCaseProvider)
          .call(searchWord);
      final repositories = result.$1;
      state = state.copyWith(repositories: repositories);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadMore(String searchWord) async {
    try {
      final result = await ref
          .read(githubRepositorySearchLoadMoreUseCaseProvider)
          .call((searchWord, state.imcompleteResults, state.page));
      final repositories = result.$1;
      state = state.copyWith(repositories: repositories);
    } catch (e) {
      //
    }
  }
}
