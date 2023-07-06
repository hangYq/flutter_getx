import 'package:get/get.dart';
import 'package:simple_shared_preferences/simple_shared_preferences.dart';

import '../../request/request.dart';
import '../../utils/logger.dart';

class HomeController extends GetxController {
  int counter = 0;

  void inc() {
    counter++;
    update();
  }

  void dec() {
    counter--;
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // TODO: test simplePreference
    final simplePreference = await SimpleSharedPreferences.getInstance();
    await simplePreference.set('name', 'simple shared preferences');
    logger.i('========${simplePreference.get('name')}');
    var a = await httpClient.fetch1('/article/list/0/json');
    logger.i(a);
  }
}
