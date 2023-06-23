import 'package:fluttercode/view/screens/useredit.dart';

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

  void editUsers(
      {required String name,
      required String age,
      required String url,
      required String id,
      required String categ,
      required bool active}) async {
    try {
      var userResult = await RemoteAuthService()
          .editUsers(name: name, age: age, url: url, active: active, id: id, categ: categ);
      print(userResult);
    } catch (e) {
      print(e);
    }
  }

  void teachers(
      {required String name,
      required String age,
      required String url,
      required bool active}) async {
    try {
      var userResult = await RemoteAuthService()
          .addTeacher(name: name, age: age, url: url, active: active);
      print(userResult);
    } catch (e) {
      print(e);
    }
  }

}
