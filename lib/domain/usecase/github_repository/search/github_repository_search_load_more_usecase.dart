// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/github_repository/search/github_repository_search_repository.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:flutter_my_blueprint/domain/usecase/usecase.dart';

part 'github_repository_search_load_more_usecase.g.dart';

@riverpod
GithubRepositorySearchLoadMoreUseCase githubRepositorySearchLoadMoreUseCase(
  Ref ref,
) {
  final repository = ref.watch(remoteGithubSearchRepositoryRepositoryProvider);
  return GithubRepositorySearchLoadMoreUseCase(repository);
}

class GithubRepositorySearchLoadMoreUseCase
    implements
        UseCase<
          (String, bool, int),
          Future<(List<GithubRepository>, int, bool)>
        > {
  final GithubRepositorySearchRepository _repository;

  GithubRepositorySearchLoadMoreUseCase(this._repository);

  @override
  Future<(List<GithubRepository>, int, bool)> call(
    (String, bool, int) params,
  ) async {
    final query = params.$1;
    final imcompleteResults = params.$2;
    final currentPage = params.$3;

    if (query.isEmpty) {
      throw Exception('query is empty');
    }
    if (!imcompleteResults) {
      throw Exception('imcompleteResults is false');
    }

    final response = await _repository.searchRepositories(
      query,
      currentPage + 1,
    );

    return (response.$1.items, response.$2, response.$1.imcompleteResults);
  }
}
