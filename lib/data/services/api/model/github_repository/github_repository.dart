import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository.g.dart';
part 'github_repository.freezed.dart';

@freezed
class GithubRepositoryOwner with _$GithubRepositoryOwner {
  factory GithubRepositoryOwner({
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _GithubRepositoryOwner;
  const GithubRepositoryOwner._();

  factory GithubRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryOwnerFromJson(json);
}

@freezed
class GithubRepository with _$GithubRepository {
  @JsonSerializable(explicitToJson: true)
  factory GithubRepository({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'full_name') required String? fullName,
    required String? language,
    required GithubRepositoryOwner owner,
    @JsonKey(name: 'stargazers_count') required num? stargazersCount,
    @JsonKey(name: 'watchers_count') required num? watchersCount,
    @JsonKey(name: 'forks_count') required num? forksCount,
    @JsonKey(name: 'issues_count') required num? issuesCount,
  }) = _GithubRepository;
  const GithubRepository._();

  factory GithubRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryFromJson(json);
}

@freezed
class GithubSearchRepositoriesResponse with _$GithubSearchRepositoriesResponse {
  @JsonSerializable(explicitToJson: true)
  factory GithubSearchRepositoriesResponse({
    @JsonKey(name: 'total_count') required num totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<GithubRepository> items,
  }) = _GithubSearchRepositoriesResponse;
  const GithubSearchRepositoriesResponse._();

  factory GithubSearchRepositoriesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GithubSearchRepositoriesResponseFromJson(json);
}
