import 'package:dio/dio.dart';

import 'package:flutter_my_blueprint/data/services/api/github_dio.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repository_search_api.g.dart';

@riverpod
GithubRepositorySearchApi githubRepositorySearchApi(Ref ref) {
  return GithubRepositorySearchApi(ref.watch(githubDioProvider));
}

@RestApi()
abstract class GithubRepositorySearchApi {
  factory GithubRepositorySearchApi(Dio dio) = _GithubRepositorySearchApi;

  @GET('/search/repositories')
  Future<GithubSearchRepositoriesResponse> searchRepositories(
    @Query('q') String searchKeyword,
    @Query('page') int page,
  );
}
