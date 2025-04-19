import 'package:cores_core/usecase/usecase.dart';
import 'package:flutter_my_blueprint/features/github_repository/common/domain/model/github_repository.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/data/repository/provider/github_repository_search_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repository_search_usecase.g.dart';

@riverpod
GithubRepositorySearchUseCase githubRepositorySearchUseCase(Ref ref) {
  final repository = ref.watch(remoteGithubSearchRepositoryRepositoryProvider);
  return GithubRepositorySearchUseCase(repository);
}

class GithubRepositorySearchUseCase
    implements UseCase<String, Future<(List<GithubRepository>, int, bool)>> {
  GithubRepositorySearchUseCase(this._repository);
  final GithubRepositorySearchRepository _repository;

  @override
  Future<(List<GithubRepository>, int, bool)> call(String query) async {
    if (query.isEmpty) {
      throw Exception('query is empty');
    }
    final response = await _repository.searchRepositories(query, 1);
    return (response.$1.items, response.$2, response.$1.incompleteResults);
  }
}
