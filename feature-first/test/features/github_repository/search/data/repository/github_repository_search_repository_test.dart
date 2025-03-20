import 'package:flutter_my_blueprint/features/github_repository/common/domain/model/github_repository.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/data/api/github_repository_search_api.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/data/repository/github_repository_search_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_repository_search_repository_test.mocks.dart';

@GenerateMocks([GithubRepositorySearchApi])
void main() {
  group('GithubRepositorySearchRepository tests', () {
    late ProviderContainer container;
    late MockGithubRepositorySearchApi api;

    setUp(() {
      api = MockGithubRepositorySearchApi();
      container = ProviderContainer(
        overrides: [githubRepositorySearchApiProvider.overrideWithValue(api)],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('searchRepository test', () async {
      const searchWord = 'apple';
      const page = 1;
      final searchResponse = GithubSearchRepositoriesResponse(
        totalCount: 2,
        incompleteResults: false,
        items: [
          GithubRepository(
            name: 'apple',
            fullName: 'apple',
            issuesCount: 0,
            stargazersCount: 1,
            watchersCount: 1,
            forksCount: 1,
            language: 'English',
            owner: GithubRepositoryOwner(avatarUrl: 'https://example.com'),
          ),
        ],
      );

      when(api.searchRepositories(searchWord, page)).thenAnswer((_) async {
        return searchResponse;
      });

      final repo = container.read(
        remoteGithubSearchRepositoryRepositoryProvider,
      );
      final result = await repo.searchRepositories(searchWord, page);

      expect(result, (searchResponse, page));
    });
  });
}
