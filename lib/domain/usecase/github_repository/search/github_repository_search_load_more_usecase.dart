// Package imports:
// Project imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/github_repository/search/github_repository_search_repository.dart';
import '../../../../data/services/api/model/github_repository/github_repository.dart';
import '../../usecase.dart';

part 'github_repository_search_load_more_usecase.g.dart';

@riverpod
GithubRepositorySearchLoadMoreUseCase githubRepositorySearchLoadMoreUseCase(
  Ref ref,
) {
  final GithubRepositorySearchRepository repository = ref.watch(
    remoteGithubSearchRepositoryRepositoryProvider,
  );
  return GithubRepositorySearchLoadMoreUseCase(repository);
}

class GithubRepositorySearchLoadMoreUseCase
    implements
        UseCase<
          (String, bool, int),
          Future<(List<GithubRepository>, int, bool)>
        > {
  GithubRepositorySearchLoadMoreUseCase(this._repository);
  final GithubRepositorySearchRepository _repository;

  @override
  Future<(List<GithubRepository>, int, bool)> call(
    (String, bool, int) params,
  ) async {
    final String query = params.$1;
    final bool incompleteResults = params.$2;
    final int currentPage = params.$3;

    if (query.isEmpty) {
      throw Exception('query is empty');
    }
    if (!incompleteResults) {
      throw Exception('incompleteResults is false');
    }

    final (GithubSearchRepositoriesResponse, int) response = await _repository
        .searchRepositories(query, currentPage + 1);

    return (response.$1.items, response.$2, response.$1.incompleteResults);
  }
}
