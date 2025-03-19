class AppSharedPreferenceKey<T> {
  final String keyName;

  const AppSharedPreferenceKey(this.keyName);

  static const favofites = AppSharedPreferenceKey<List<String>>('favorites');
}
