class AppSharedPreferenceKey<T> {
  const AppSharedPreferenceKey(this.keyName);
  final String keyName;

  static const favofites = AppSharedPreferenceKey<List<String>>('favorites');
}
