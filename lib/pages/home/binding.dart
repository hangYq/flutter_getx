import 'package:get/get.dart';

import './controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      // 当你需要在整个应用程序中保持该实例的生命时使用。
      permanent: true,
    );
  }
}
