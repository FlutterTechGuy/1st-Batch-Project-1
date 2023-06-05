class AuthHelper {
  static bool checkUserInputs(
      {required String email, required String password}) {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    return true;
  }
}
