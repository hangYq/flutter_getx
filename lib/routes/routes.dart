import 'package:get/get.dart';

import '../middlewares/login_middleware.dart';
import '../pages/home/binding.dart';
import '../pages/login/view.dart';
import '../pages/search/view.dart';
import '../pages/tabs/view.dart';

class AppRoutes {
  static const String tabs = '/tabs';
  static const String login = '/login';
  static const String search = '/search';

  static List<GetPage> routes = [
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
