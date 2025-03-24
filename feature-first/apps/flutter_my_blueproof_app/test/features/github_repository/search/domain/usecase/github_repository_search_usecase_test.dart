import 'package:flutter_my_blueprint/features/github_repository/common/domain/model/github_repository.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/data/repository/provider/github_repository_search_repository.dart';
import 'package:flutter_my_blueprint/features/github_repository/search/domain/usecase/provider/github_repository_search_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_repository_search_load_more_usecase_test.mocks.dart';

@GenerateMocks([GithubRepositorySearchRepository])
void main() {
  late MockGithubRepositorySearchRepository mockRepository;
  late GithubRepositorySearchUseCase useCase;

  setUp(() {
    mockRepository = MockGithubRepositorySearchRepository();
    useCase = GithubRepositorySearchUseCase(mockRepository);
  });

  group('GithubRepositorySearchUseCase Tests', () {
    test('should throw an exception when query is empty', () async {
      expect(() => useCase(''), throwsException);
    });

    test(
      'return a list of repositories, total count, and incomplete results',
      () async {
        const query = 'flutter';
        final githubRepository = GithubRepository(
          name: 'apple',
          fullName: 'apple',
          issuesCount: 0,
          stargazersCount: 1,
          watchersCount: 1,
          forksCount: 1,
          language: 'English',
          owner: GithubRepositoryOwner(avatarUrl: 'https://example.com'),
        );
        final response = GithubSearchRepositoriesResponse(
          items: [githubRepository],
          totalCount: 1,
          incompleteResults: false,
        );

        when(
          mockRepository.searchRepositories(query, 1),
        ).thenAnswer((_) async => (response, 1));

        final result = await useCase(query);

        expect(result.$1, [githubRepository]);
        expect(result.$2, 1);
        expect(result.$3, false);
      },
    );

    test('should handle incomplete results', () async {
      const query = 'flutter';
      final githubRepository = GithubRepository(
        name: 'apple',
        fullName: 'apple',
        issuesCount: 0,
        stargazersCount: 1,
        watchersCount: 1,
        forksCount: 1,
        language: 'English',
        owner: GithubRepositoryOwner(avatarUrl: 'https://example.com'),
      );
      final response = GithubSearchRepositoriesResponse(
        items: [githubRepository],
        totalCount: 1,
        incompleteResults: true,
      );

      when(
        mockRepository.searchRepositories(query, 1),
      ).thenAnswer((_) async => (response, 1));

      final result = await useCase(query);

      expect(result.$1, [githubRepository]);
      expect(result.$2, 1);
      expect(result.$3, true);
    });
  });
}
