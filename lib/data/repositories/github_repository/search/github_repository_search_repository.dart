// Package imports:
import 'package:flutter_my_blueprint/data/services/api/github_repository/search/github_repository_search_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';

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
  final GithubRepositorySearchApi api;

  RemoteGithubRepositorySearchRepository(this.api);

  @override
  Future<(GithubSearchRepositoriesResponse, int)> searchRepositories(
    String searchWord,
    int page,
  ) async {
    final response = await api.searchRepositories(searchWord, page);
    return (response, page);
  }
}
