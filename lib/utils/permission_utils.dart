import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// 1. 检查权限

  static checkPermisson() async {}

  /// 2. 发起权限申请
  ///   a. 直接申请权限
  ///   b. 打开应用系统设置页面
  ///
  static Future<void> requestPermiss(Permission permission) async {
    //发起权限申请
    PermissionStatus status = await permission.request();
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    // 返回权限申请的状态 status
  }
}
