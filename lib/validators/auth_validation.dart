class AuthValidation {
  static bool isValidEmail(String email) {
    return email.length > 6 && email.contains('@');
  }

  static bool isValidPassword(String password) {
    return password.length > 6;
  }

  static bool isValidPhone(String phone) {
    return phone.length >= 10;
  }
}
