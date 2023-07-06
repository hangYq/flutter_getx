import 'package:get/get.dart';
import 'package:simple_shared_preferences/simple_shared_preferences.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}

class StorageService extends GetxService {
  Future<SimpleSharedPreferences> init() async {
    return await SimpleSharedPreferences.getInstance();
  }
}
