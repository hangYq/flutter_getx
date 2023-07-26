import 'package:dart_mock/dart_mock.dart' as mock;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class UsersProfileController extends GetxController {
  String? avatar;
  num phone = 0;
  String nickName = '';
  String gender = '';

  Future<void> initFetchData() async {
    avatar = mock.image();
    phone = mock.integer();
    nickName = mock.cname();
    gender = mock.string();
    update();
  }

  void chooseImage() {}

  void requestPermiss(Permission permission) async {
    //发起权限申请
    PermissionStatus status = await permission.request();
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    // 返回权限申请的状态 status
  }

  void checkPermisson() async {
    //当前权限
    Permission permission = Permission.camera;
    //权限的状态
    PermissionStatus status = await permission.status;

    //第一次申请用户拒绝
    if (status.isDenied) {
      showDialog();
    } else if (status.isPermanentlyDenied) {
      //用户点击了 拒绝且不再提示
    } else if (status.isGranted) {
      //权限通过
    }
  }

  // 弹出权限被拒绝弹窗
  showDialog() {
    Get.dialog(Center(
      child: Container(
        color: Colors.white,
        width: 300,
        height: 300,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // openAppSettings();
                requestPermiss(Permission.camera);
              },
              child: const Text('去设置'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('取消'),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    initFetchData();
  }
}
