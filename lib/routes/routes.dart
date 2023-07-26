import 'package:get/get.dart';

import 'package:flutter_getx/pages/demo/view.dart';

import '../middlewares/login_middleware.dart';
import '../pages/demo/binding.dart';
import '../pages/home/binding.dart';
import '../pages/login/view.dart';
import '../pages/search/view.dart';
import '../pages/tabs/view.dart';
import '../pages/users_profile/binding.dart';
import '../pages/users_profile/view.dart';

class AppRoutes {
  static const String demo = '/demo';
  static const String usersProfile = '/usersProfile';
  static const String tabs = '/tabs';
  static const String login = '/login';
  static const String search = '/search';

  static List<GetPage> routes = [
    GetPage(
      name: demo,
      page: () => const DemoPage(),
      bindings: [
        DemoBinding(),
      ],
    ),
    GetPage(
      name: usersProfile,
      page: () => const UsersProfile(),
      bindings: [
        UsersProfileBinding(),
      ],
    ),
    GetPage(
      name: tabs,
      page: () => const TabsPage(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: search,
      page: () => const SearchPage(),
      middlewares: [
        LoginMiddleware(),
      ],
    ),
  ];
}
