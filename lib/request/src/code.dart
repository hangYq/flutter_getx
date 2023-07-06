class HttpCode {
  static const int unknownError = -9000;
  static const int networkError = -1;
  static const int networkTimeout = -2;

  static const int badRequest = 404;
  static const int unauthorized = 401;
  static const int serverError = 500;

  static const int ok = 200;
  static const int created = 201;

  // Business Response Data Code
  /// 4001-您未登陆，请登陆
  static const int bUnauth4001 = 4001;

  /// 4002-未绑定手机号
  static const int bUnauth4002 = 4002;

  /// 4003-登陆失效,请重新登陆
  static const int bUnauth4003 = 4003;

  /// 3105-登陆失效,请重新登陆
  static const int bUnauth3105 = 3105;

  /// 4005-登陆token不合法
  static const int bUnauth4005 = 4005;

  // 2001-参数签名错误
  static const int bSignature2001 = 2001;
}
