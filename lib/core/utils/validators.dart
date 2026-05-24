class Validators {
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static bool isPositiveNumber(num? value) {
    return value != null && value > 0;
  }
}
