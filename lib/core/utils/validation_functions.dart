bool isValidEmail(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }
  return isInputStringValid;
}

bool isValidPassword(String value, {required bool isRequired}) {
  if (!isRequired && value.isEmpty) {
    return true; // Empty password is considered valid if not required
  }

  if (value.isEmpty) {
    return false; // Empty password is invalid if required
  }

  // Minimum length requirement (adjust as needed)
  int minLength = 8;
  if (value.length < minLength) {
    return false; // Password too short
  }

  // Password complexity requirements (adjust as needed)
  bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
  bool hasLowercase = value.contains(RegExp(r'[a-z]'));
  bool hasDigit = value.contains(RegExp(r'[0-9]'));
  bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  // At least two different character types required
  int numComplexityTypes = 0;
  numComplexityTypes += hasUppercase ? 1 : 0;
  numComplexityTypes += hasLowercase ? 1 : 0;
  numComplexityTypes += hasDigit ? 1 : 0;
  numComplexityTypes += hasSpecialCharacters ? 1 : 0;

  return numComplexityTypes >= 2;
}
