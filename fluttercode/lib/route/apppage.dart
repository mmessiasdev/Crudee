import 'package:fluttercode/view/screens/homepage.dart';
import 'package:get/get.dart';

import 'approute.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const HomePage(),
    ),
  ];
}
