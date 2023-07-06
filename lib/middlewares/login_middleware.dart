import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/logger.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    logger.i("-------");
    logger.i(route);
    return null; //不做任何操作

    //没有权限跳转到登录页面
    // return const RouteSettings(name: "/login", arguments: {});
  }
}
