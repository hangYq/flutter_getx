// 保证（兜底）生产环境变量绝对正确，本地调试可改变，切勿提交到远程仓库！

String _defaultSonEnv = EnvTypes.production;

class EnvTypes {
  static String development = 'development';
  static String test = 'test';
  static String staging = 'staging';
  static String production = 'production';
}

class Config {
  factory Config({
    String? baseUrl,
    bool requestDebug = false,
    bool? isInNative,
    String? proxyUrl = '',
    String? enableNetLog = '0',
    int? httpConnectTimeout,
    int httpReceiveTimeout = 10000,
  }) {
    _singleton ??= Config._(
      baseUrl: baseUrl,
      requestDebug: requestDebug,
      proxyUrl: proxyUrl,
      enableNetLog: enableNetLog,
      httpConnectTimeout: httpConnectTimeout,
      httpReceiveTimeout: httpReceiveTimeout,
    );
    return _singleton!;
  }
  Config._({
    this.baseUrl,
    this.requestDebug,
    this.proxyUrl,
    this.enableNetLog,
    this.httpConnectTimeout,
    this.httpReceiveTimeout,
  });

  static Config? _singleton;

  final String? baseUrl;

  final bool? requestDebug;
  final int? httpConnectTimeout;
  final int? httpReceiveTimeout;

  /// 测试环境抓包
  final String? proxyUrl;

  /// 开启网络日志 1：开启， 0 或 null：不开启
  final String? enableNetLog;
}

class AppConfig {
  AppConfig._();

  static String? get env => _defaultSonEnv;

  static Config? get config {
    Config? config;

    if (env == EnvTypes.development) {
      config = Config(
        baseUrl: 'https://www.wanandroid.com',
        requestDebug: true,
      );
    } else if (env == EnvTypes.test) {
      config = Config(
        baseUrl: 'https://www.wanandroid.com',
        requestDebug: true,
      );
    } else if (env == EnvTypes.staging) {
      config = Config(
        baseUrl: 'https://www.wanandroid.com',
      );
    } else if (env == EnvTypes.production) {
      config = Config(
        baseUrl: 'https://www.wanandroid.com',
      );
    }
    return config;
  }
}

enum BuildMode {
  release,
  profile,
  debug,
}

BuildMode buildMode = () {
  if (const bool.fromEnvironment('dart.vm.product')) {
    return BuildMode.release;
  }
  BuildMode result = BuildMode.profile;
  assert(() {
    result = BuildMode.debug;
    return true;
  }());
  return result;
}();
