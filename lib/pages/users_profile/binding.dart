import 'package:get/get.dart';

import './controller.dart';

class UsersProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UsersProfileController>(
      UsersProfileController(),
    );
  }
}
