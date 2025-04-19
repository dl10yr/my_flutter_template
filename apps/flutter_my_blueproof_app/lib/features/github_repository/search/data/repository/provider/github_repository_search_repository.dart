import 'package:cores_core/exception/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_my_blueprint/features/github_repository/common/domain/model/github_repository.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/data/api/provider/github_repository_search_api.dart';
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
    try {
      final response = await api.searchRepositories(searchWord, page);
      return (response, page);
    } on DioException catch (e) {
      throw AppException.fromNetworkException(e);
    }
  }
}
