import 'package:flutter/material.dart';
import 'package:flutter_getx/routes/routes.dart';
import 'package:get/get.dart';

import './controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (HomeController controller) {
          return Column(
            children: [
              const Text('home'),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.search);
                },
                child: const Text('跳转到  search 页面'),
              ),
              Text(
                "${controller.counter}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.inc();
                },
                child: const Text("计数器加1"),
              ),
            ],
          );
        },
      ),
    );
  }
}
