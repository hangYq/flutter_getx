import './controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersProfile extends StatelessWidget {
  const UsersProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人信息'),
        actions: [
          TextButton(
            child: const Text(
              '保存',
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<UsersProfileController>(
          builder: (UsersProfileController controller) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(bottom: 3),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => controller.checkPermisson(),
                  child: Row(
                    children: [
                      const Text('头像'),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.network(
                              controller.avatar ?? '',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.only(bottom: 3),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Text('昵称'),
                    Expanded(
                      child: Text(
                        controller.nickName,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
