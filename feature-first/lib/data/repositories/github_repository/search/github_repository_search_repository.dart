import 'package:flutter_my_blueprint/data/services/api/github_repository/search/github_repository_search_api.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repository_search_repository.g.dart';

abstract class GithubRepositorySearchRepository {
  Future<(GithubSearchRepositoriesResponse, int)> searchRepositories(
    String searchWord,
    int page,
  );
}

@riverpod
GithubRepositorySearchRepository remoteGithubSearchRepositoryRepository(
  Ref ref,
) {
  return RemoteGithubRepositorySearchRepository(
    ref.watch(githubRepositorySearchApiProvider),
  );
}

class RemoteGithubRepositorySearchRepository
    implements GithubRepositorySearchRepository {
  RemoteGithubRepositorySearchRepository(this.api);
  final GithubRepositorySearchApi api;

  @override
  Future<(GithubSearchRepositoriesResponse, int)> searchRepositories(
    String searchWord,
    int page,
  ) async {
    final response = await api.searchRepositories(searchWord, page);
    return (response, page);
  }
}
