import 'package:dio/dio.dart';

import '../../utils/logger.dart';
import './code.dart';

class HttpInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    try {
      final int? retCode = response.data['code'];
      if (retCode == HttpCode.bUnauth4001 ||
          retCode == HttpCode.bUnauth4003 ||
          retCode == HttpCode.bUnauth4005 ||
          retCode == HttpCode.bUnauth3105) {
        // 跳转到登录
      }
    } catch (e) {
      // todo:
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.receiveTimeout) {
      // 接口请求超时
      logger.i('服务器连接失败');
    } else if (err.type == DioExceptionType.connectionTimeout) {
      // 弱网
      logger.i('网络状况不佳');
    } else {
      logger.i('遇到未知错误');
    }
    return super.onError(err, handler);
  }
}
