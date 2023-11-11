class MockAuthService {
  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (userName == "abs.junnior" && password == "1234") {
      return true;
    } else {
      return false;
    }
  }
}
