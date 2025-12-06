// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubRepositoryOwnerImpl _$$GithubRepositoryOwnerImplFromJson(
  Map<String, dynamic> json,
) => _$GithubRepositoryOwnerImpl(avatarUrl: json['avatar_url'] as String);

Map<String, dynamic> _$$GithubRepositoryOwnerImplToJson(
  _$GithubRepositoryOwnerImpl instance,
) => <String, dynamic>{'avatar_url': instance.avatarUrl};

_$GithubRepositoryImpl _$$GithubRepositoryImplFromJson(
  Map<String, dynamic> json,
) => _$GithubRepositoryImpl(
  name: json['name'] as String,
  fullName: json['full_name'] as String?,
  language: json['language'] as String?,
  owner: GithubRepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>),
  stargazersCount: json['stargazers_count'] as num?,
  watchersCount: json['watchers_count'] as num?,
  forksCount: json['forks_count'] as num?,
  issuesCount: json['issues_count'] as num?,
);

Map<String, dynamic> _$$GithubRepositoryImplToJson(
  _$GithubRepositoryImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'full_name': instance.fullName,
  'language': instance.language,
  'owner': instance.owner.toJson(),
  'stargazers_count': instance.stargazersCount,
  'watchers_count': instance.watchersCount,
  'forks_count': instance.forksCount,
  'issues_count': instance.issuesCount,
};

_$GithubSearchRepositoriesResponseImpl
_$$GithubSearchRepositoriesResponseImplFromJson(Map<String, dynamic> json) =>
    _$GithubSearchRepositoriesResponseImpl(
      totalCount: json['total_count'] as num,
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => GithubRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GithubSearchRepositoriesResponseImplToJson(
  _$GithubSearchRepositoriesResponseImpl instance,
) => <String, dynamic>{
  'total_count': instance.totalCount,
  'incomplete_results': instance.incompleteResults,
  'items': instance.items.map((e) => e.toJson()).toList(),
};
