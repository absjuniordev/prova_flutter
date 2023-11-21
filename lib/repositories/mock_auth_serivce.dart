class MockAuthService {
  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (userName == "target" && password == "1234") {
      return true;
    } else {
      return false;
    }
  }
}
