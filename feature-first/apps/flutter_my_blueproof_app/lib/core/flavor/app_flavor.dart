enum AppFlavor { dev, stg, prd }

AppFlavor stringToFlavor(String value) {
  for (final enumValue in AppFlavor.values) {
    if (value == enumValue.name) {
      return enumValue;
    }
  }
  return AppFlavor.prd;
}

bool isPrd() {
  return stringToFlavor(const String.fromEnvironment('flavor')) ==
      AppFlavor.prd;
}
