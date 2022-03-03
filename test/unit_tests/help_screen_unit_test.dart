import 'package:flutter_test/flutter_test.dart';

void main() {
  String? testValue;

  /// mock method for splashAndNavigate()
  Future<void> mockSplashAndNavigate(String data) async {
    await Future.delayed(const Duration(seconds: 5));
    testValue = data; // mocks the Get.offAllNamed()
  }

  test("splashAndNavigate() test", () async {
    await mockSplashAndNavigate("test");
    expect(testValue, "test");
  });
}
