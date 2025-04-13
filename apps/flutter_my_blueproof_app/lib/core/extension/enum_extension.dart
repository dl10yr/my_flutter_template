extension EnumByName<T extends Enum> on Iterable<T> {
  T? byNameOrNull(String? name) {
    if (name == null) {
      return null;
    }

    for (final MapEntry(key: key, value: value) in asNameMap().entries) {
      if (key == name) {
        return value;
      }
    }

    return null;
  }
}
