class AppRoute<T> {
  AppRoute({required this.name, required this.path, required this.fullPath});
  final String name;
  final String path;
  final T fullPath;
}

typedef QuestionSetRoute = String Function(String questionSetId);

class AppRoutes {
  AppRoutes._() {
    throw Exception('AppRoutes is static.');
  }

  static final AppRoute<String> searchTab = AppRoute<String>(
    name: 'github_repository_search',
    path: '/github_repository_search',
    fullPath: '/github_repository_search',
  );
  static final AppRoute<String> settings = AppRoute(
    name: 'settings',
    path: '/settings',
    fullPath: '/settings',
  );
}
