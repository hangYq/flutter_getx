import 'package:dio/dio.dart';

import './code.dart';

String getErrorMsg(dynamic err) {
  String msg = '';
  final List<int> disConnectCodes = <int>[51, 8, 101, 7];
  try {
    final int errCode = err.error?.osError?.errorCode;
    if (err.type == DioExceptionType.receiveTimeout) {
      // 接口请求超时
      msg = '服务器连接失败';
    } else if (err.type == DioExceptionType.connectionTimeout) {
      // 弱网
      msg = '网络状况不佳';
    } else if (disConnectCodes.contains(errCode)) {
      // 断网
      msg = '当前无可用网络';
    } else {
      msg = '遇到未知错误';
    }
  } catch (e) {
    msg = '遇到未知错误';
  }
  return msg;
}

int getErrorCode(dynamic err) {
  int statusCode = HttpCode.unknownError;
  final List<int> disConnectCodes = <int>[51, 8, 101, 7];
  try {
    final int errCode = err.error?.osError?.errorCode;
    if (err.type == DioExceptionType.receiveTimeout) {
      // 接口请求超时
      statusCode = HttpCode.networkTimeout;
    } else if (err.type == DioExceptionType.connectionTimeout) {
      // 弱网
      statusCode = HttpCode.networkTimeout;
    } else if (disConnectCodes.contains(errCode)) {
      // 断网
      statusCode = HttpCode.networkError;
    }
  } catch (e) {
    statusCode = HttpCode.unknownError;
  }
  return statusCode;
}
