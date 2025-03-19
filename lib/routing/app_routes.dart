class AppRoute<T> {
  final String name;
  final String path;
  final T fullPath;

  AppRoute({required this.name, required this.path, required this.fullPath});
}

typedef QuestionSetRoute = String Function(String questionSetId);

class AppRoutes {
  AppRoutes._() {
    throw Exception('AppRoutes is static.');
  }

  static final searchTab = AppRoute<String>(
    name: 'github_repository_search',
    path: '/github_repository_search',
    fullPath: '/github_repository_search',
  );
  static final settings = AppRoute(
    name: 'settings',
    path: '/settings',
    fullPath: '/settings',
  );
}
