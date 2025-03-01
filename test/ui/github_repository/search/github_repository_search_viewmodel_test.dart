// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:flutter_my_blueprint/data/repositories/auth/auth_repository.dart';
import 'package:flutter_my_blueprint/data/services/api/github_repository/search/github_repository_search_api.dart';
import 'package:flutter_my_blueprint/data/services/api/model/github_repository/github_repository.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_load_more_usecase.dart';
import 'package:flutter_my_blueprint/domain/usecase/github_repository/search/github_repository_search_usecase.dart';
import 'package:flutter_my_blueprint/ui/github_repository/search/github_repository_search_viewmodel.dart';
import 'github_repository_search_viewmodel_test.mocks.dart';

@GenerateMocks([GithubRepositorySearchUseCase, GithubRepositorySearchLoadMoreUseCase, GithubRepositorySearchApi, AuthRepository])

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late ProviderContainer container;
  late MockGithubRepositorySearchUseCase mockSearchUseCase;
  late MockGithubRepositorySearchLoadMoreUseCase mockLoadMoreUseCase;

  setUp(() {
    mockSearchUseCase = MockGithubRepositorySearchUseCase();
    mockLoadMoreUseCase = MockGithubRepositorySearchLoadMoreUseCase();
    container = ProviderContainer(
      overrides: [
        githubRepositorySearchUseCaseProvider.overrideWithValue(mockSearchUseCase),
        githubRepositorySearchLoadMoreUseCaseProvider.overrideWithValue(mockLoadMoreUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('search', () async {
    final searchWord = 'apple';
    final page = 1;
    final searchResponse = GithubSearchRepositoriesResponse(
      totalCount: 2,
      incompleteResults: false,
      items: [GithubRepository(
        name: 'apple',
        fullName: 'apple',
        issuesCount: 0,
        stargazersCount: 1,
        watchersCount: 1,
        forksCount: 1,
        language: 'English',
      )],
    );


    when(mockSearchUseCase.call(searchWord)).thenAnswer((_) async {
      return (searchResponse.items, page, searchResponse.incompleteResults);
    });

    final githubRepoSearchViewModel = container.read(githubRepositorySearchViewModelProvider.notifier);

    final listener = Listener<AsyncValue<GithubRepositorySearchState>>();

    container.listen(githubRepositorySearchViewModelProvider, listener.call, fireImmediately: true);
    final initialState = GithubRepositorySearchState(repositories: [], incompleteResults: true, page: 1);

    await container.read(githubRepositorySearchViewModelProvider.future);
    verify(
      listener.call(null, AsyncData(initialState)),
    );

    await githubRepoSearchViewModel.search('apple');

    final ttt = AsyncLoading<GithubRepositorySearchState>()
                .copyWithPrevious(AsyncData(initialState), isRefresh: false);

    verifyInOrder([
      listener.call(AsyncData(initialState), ttt),
      listener.call(ttt, AsyncData(GithubRepositorySearchState(
        repositories: searchResponse.items,
        page: page,
        incompleteResults: false))),
    ]);
  });
}
