import 'package:flutter_my_blueprint/data/repositories/github_repository/search/github_repository_search_repository.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_load_more_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_repository_search_usecase_test.mocks.dart';

@GenerateMocks([GithubRepositorySearchRepository])
void main() {
  late MockGithubRepositorySearchRepository mockRepository;
  late GithubRepositorySearchLoadMoreUseCase useCase;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockGithubRepositorySearchRepository();
    container = ProviderContainer(
      overrides: [
        remoteGithubSearchRepositoryRepositoryProvider.overrideWithValue(
          mockRepository,
        ),
      ],
    );
    useCase = container.read(githubRepositorySearchLoadMoreUseCaseProvider);
  });
  group('GithubRepositorySearchLoadMoreUseCase Tests', () {
    test('should throw exception when query is empty', () async {
      expect(
        () async => useCase.call(('', true, 1)),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('query is empty'),
          ),
        ),
      );
    });

    test('should throw exception when incompleteResults is false', () async {
      expect(
        () async => useCase.call(('flutter', false, 1)),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('incompleteResults is false'),
          ),
        ),
      );
    });

    test(
      'should return list of repositories, next page, and incompleteResults',
      () async {
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
        final response = (
          GithubSearchRepositoriesResponse(
            items: [githubRepository],
            incompleteResults: true,
            totalCount: 2,
          ),
          2,
        );

        when(
          mockRepository.searchRepositories('flutter', 2),
        ).thenAnswer((_) async => response);

        final result = await useCase.call(('flutter', true, 1));

        expect(result.$1, [githubRepository]);
        expect(result.$2, 2);
        expect(result.$3, true);
      },
    );
  });
}
