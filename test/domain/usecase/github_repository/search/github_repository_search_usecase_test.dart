// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/github_repository/search/github_repository_search_repository.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_usecase.dart';
import 'github_repository_search_usecase_test.mocks.dart';

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
      'should return a list of repositories, total count, and incomplete results flag',
      () async {
        final query = 'flutter';
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
      final query = 'flutter';
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
