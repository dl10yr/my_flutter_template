import 'package:cores_core/data/service/api/provider/github_dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/domain/model/github_repository.dart';

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
