class Validators {
  static final RegExp _emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  
  static final RegExp _numericRegex = RegExp(r'[0-9]');
  
  // A more comprehensive special character regex to cover all standard keyboard symbols
  static final RegExp _specialCharRegex = RegExp(
    r'[!@#$%^&*(),.?":{}|<>\-_=+\\\/\[\]~`@#\$%\^&\*\(\)\+=\{\}\[\];:\?<>\.\/]',
  );

  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static bool isPositiveNumber(num? value) {
    return value != null && value > 0;
  }

  /// Validates email address format
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validates password based on security strength:
  /// - Min 6 characters, max 20 characters
  /// - Contains at least one digit
  /// - Contains at least one special character
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value.length > 20) {
      return 'Password must be at most 20 characters';
    }
    if (!_numericRegex.hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!_specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
}

