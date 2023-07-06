import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_getx/utils/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/app.dart' show AppConfig;
import './code.dart';
import './interceptors.dart';
import './model.dart';
import './utils.dart';

class HttpRequest {
  factory HttpRequest() {
    _singleton ??= HttpRequest._();
    return _singleton!;
  }

  HttpRequest._() {
    final BaseOptions options = BaseOptions(
      baseUrl: AppConfig.config!.baseUrl!,
      // connectTimeout:
      //     Duration(milliseconds: AppConfig.config!.httpConnectTimeout!),
      // receiveTimeout:
      //     Duration(milliseconds: AppConfig.config!.httpReceiveTimeout!),
    );
    _dio = Dio(options);

    _dio!.interceptors.add(HttpInterceptors());
    if (!kReleaseMode) {
      _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ));
    }
  }

  static HttpRequest? _singleton;
  Dio? _dio;

  Future<dynamic> fetch1(
    String url, {
    Map<String, dynamic>? params,
  }) async {
    dynamic result;
    try {
      final Options options = Options(
        headers: <String, dynamic>{
          Headers.contentTypeHeader: 'application/json',
        },
      );
      final Response<Map<String, dynamic>> response = await _dio!.get(
        url,
        queryParameters: params,
        options: options,
      );
      return response;
    } catch (err, stackTrace) {
      final String msg = getErrorMsg(err);
      logger.i(result);
      logger.e(stackTrace);
    }
    return result;
  }

  /// 请求和响应都是 JSON 格式的 GET 请求
  Future<BaseApiResponse<T>> fetch<T>(
    String url,
    dynamic fromJsonMethod, {
    Map<String, dynamic>? params,
  }) async {
    BaseApiResponse<T>? result;
    try {
      final Options options = Options(
        headers: <String, dynamic>{
          Headers.contentTypeHeader: 'application/json',
        },
      );
      final Response<Map<String, dynamic>> response = await _dio!.get(
        url,
        queryParameters: params,
        options: options,
      );
      result = BaseApiResponse<T>(response.data!, fromJsonMethod);
    } catch (err, stackTrace) {
      final String msg = getErrorMsg(err);
      result = BaseApiResponse<T>.error(
        code: HttpCode.networkError,
        msg: msg,
      );
      logger.i(result);
      logger.e(stackTrace);
    }
    return result;
  }

  /// 请求和响应都是 JSON 格式的 POST 请求
  Future<BaseApiResponse<T>> post<T>(
    String url,
    dynamic fromJsonMethod, {
    Map<String, dynamic>? params,
  }) async {
    BaseApiResponse<T>? result;
    try {
      final Options options = Options(
        headers: <String, dynamic>{
          Headers.contentTypeHeader: 'application/json',
        },
      );
      final Response<Map<String, dynamic>> response = await _dio!.post(
        url,
        data: params ?? <String, dynamic>{},
        options: options,
      );
      result = BaseApiResponse<T>(response.data!, fromJsonMethod);
    } catch (err, stackTrace) {
      final String msg = getErrorMsg(err);
      result = BaseApiResponse<T>.error(
        code: HttpCode.networkError,
        msg: msg,
      );
      logger.i(result);
      logger.e(stackTrace);
    }
    return result;
  }
}

final HttpRequest httpClient = HttpRequest();
