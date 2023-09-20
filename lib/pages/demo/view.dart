import 'package:flutter_getx/pages/demo/plugin_demo.dart';

import '../../routes/routes.dart';
import './controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo page'),
      ),
      body: GetBuilder<DemoController>(
        builder: (DemoController controller) {
          return Column(
            children: [
              const Text('demo'),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.search);
                },
                child: const Text('跳转到  search 页面'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.usersProfile);
                },
                child: const Text('跳转到 usersProfile 页面'),
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
              PluginDemoPage(),
            ],
          );
        },
      ),
    );
  }
}
