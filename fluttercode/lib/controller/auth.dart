import '../service/remote/auth.dart';

class authController {
  void students(
      {required String name,
      required String age,
      required String url,
      required bool active}) async {
    try {
      var userResult = await RemoteAuthService()
          .addStudent(name: name, age: age, url: url, active: active);
          print(userResult);
    } catch (e) {
      print(e);
    }
  }
}
