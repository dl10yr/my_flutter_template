class AppSharedPreferenceKey<T> {
  const AppSharedPreferenceKey(this.keyName);
  final String keyName;

  static const AppSharedPreferenceKey<List<String>> favofites =
      AppSharedPreferenceKey<List<String>>('favorites');
}
