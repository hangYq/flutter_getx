import './code.dart';

typedef FromJsonMethod<T> = T Function(Map<String, dynamic> json);

class BaseApiResponse<T> {
  /// resJson: 请求返回的 JSON 数据
  /// fromJsonMethod: Data Class fromJson 方法的调用
  BaseApiResponse(Map<String, dynamic> resJson, FromJsonMethod fromJsonMethod) {
    code = resJson['code'];
    msg = resJson['msg'] ?? resJson['message'];
    if (resJson['data'] != null) {
      data = fromJsonMethod(resJson['data']);
    }
  }

  BaseApiResponse.by(this.code, this.msg, this.data);

  // HTTP 请求异常 (断网、超时等)
  BaseApiResponse.error({
    this.code,
    this.msg,
  });

  bool get isSuccess => code == HttpCode.ok;

  bool get isFailure => !isSuccess;

  int? code;
  String? msg;
  T? data;
}
