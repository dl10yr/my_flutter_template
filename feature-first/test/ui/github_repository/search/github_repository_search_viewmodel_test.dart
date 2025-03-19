import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/data/services/api/github_repository/search/github_repository_search_api.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_load_more_usecase.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_usecase.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_repository_search_viewmodel_test.mocks.dart';

abstract class ChangeListener<T> {
  void call(T? previous, T next);
}

@GenerateMocks([
  GithubRepositorySearchUseCase,
  GithubRepositorySearchLoadMoreUseCase,
  GithubRepositorySearchApi,
  AuthRepository,
  ChangeListener,
])
void main() {
  late ProviderContainer container;
  late MockGithubRepositorySearchUseCase mockSearchUseCase;
  late MockGithubRepositorySearchLoadMoreUseCase mockLoadMoreUseCase;
  final listener =
      MockChangeListener<AsyncValue<GithubRepositorySearchState>>();

  setUp(() {
    mockSearchUseCase = MockGithubRepositorySearchUseCase();
    mockLoadMoreUseCase = MockGithubRepositorySearchLoadMoreUseCase();
    container = ProviderContainer(
      overrides: [
        githubRepositorySearchUseCaseProvider.overrideWithValue(
          mockSearchUseCase,
        ),
        githubRepositorySearchLoadMoreUseCaseProvider.overrideWithValue(
          mockLoadMoreUseCase,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('GithubRepositorySearchViewModel Tests', () {
    test('search', () async {
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

      when(mockSearchUseCase.call(searchWord)).thenAnswer((_) async {
        return (searchResponse.items, page, searchResponse.incompleteResults);
      });

      final githubRepoSearchViewModel = container.read(
        githubRepositorySearchViewModelProvider.notifier,
      );

      container.listen(
        githubRepositorySearchViewModelProvider,
        listener.call,
        fireImmediately: true,
      );
      const initialState = GithubRepositorySearchState();

      await container.read(githubRepositorySearchViewModelProvider.future);
      verify(listener.call(argThat(isNull), const AsyncData(initialState)));

      await githubRepoSearchViewModel.search('apple');

      verifyInOrder([
        listener.call(
          const AsyncData(initialState),
          argThat(isA<AsyncLoading<dynamic>>()),
        ),
        listener.call(
          argThat(isA<AsyncLoading<dynamic>>()),
          AsyncData(
            GithubRepositorySearchState(
              repositories: searchResponse.items,
              incompleteResults: false,
            ),
          ),
        ),
      ]);
    });

    test('search fails', () async {
      const searchWord = 'apple';
      final exception = Exception('search failed');

      when(mockSearchUseCase.call(searchWord)).thenThrow(exception);

      final githubRepoSearchViewModel = container.read(
        githubRepositorySearchViewModelProvider.notifier,
      );

      container.listen(
        githubRepositorySearchViewModelProvider,
        listener.call,
        fireImmediately: true,
      );
      const initialState = GithubRepositorySearchState();

      await container.read(githubRepositorySearchViewModelProvider.future);
      verify(listener.call(argThat(isNull), const AsyncData(initialState)));

      await githubRepoSearchViewModel.search('apple');

      verifyInOrder([
        listener.call(
          const AsyncData(initialState),
          argThat(isA<AsyncLoading<dynamic>>()),
        ),
        listener.call(
          argThat(isA<AsyncLoading<dynamic>>()),
          argThat(
            isA<AsyncError<dynamic>>().having(
              (e) => e.error,
              'error',
              exception,
            ),
          ),
        ),
      ]);
    });
  });
}
