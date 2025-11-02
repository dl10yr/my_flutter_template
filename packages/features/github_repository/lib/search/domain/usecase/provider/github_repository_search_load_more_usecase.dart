import 'package:cores_core/usecase/usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/domain/model/github_repository.dart';
import '../../../data/repository/provider/github_repository_search_repository.dart';

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
  GithubRepositorySearchLoadMoreUseCase(this._repository);
  final GithubRepositorySearchRepository _repository;

  @override
  Future<(List<GithubRepository>, int, bool)> call(
    (String, bool, int) params,
  ) async {
    final query = params.$1;
    final incompleteResults = params.$2;
    final currentPage = params.$3;

    if (query.isEmpty) {
      throw Exception('query is empty');
    }
    if (!incompleteResults) {
      throw Exception('incompleteResults is false');
    }

    final response = await _repository.searchRepositories(
      query,
      currentPage + 1,
    );

    return (response.$1.items, response.$2, response.$1.incompleteResults);
  }
}
