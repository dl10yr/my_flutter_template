enum AppFlavor { dev, stg, prd }

AppFlavor stringToFlavor(String value) {
  for (final enumValue in AppFlavor.values) {
    if (value == enumValue.name) {
      return enumValue;
    }
  }
  return AppFlavor.prd;
}
