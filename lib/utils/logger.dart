import 'package:logger/logger.dart';

import '../../../config/app.dart';

/// https://pub.dev/packages/logger
Logger logger = Logger(
  printer: PrettyPrinter(printTime: true),
  level: AppConfig.env == EnvTypes.production ? Level.nothing : Level.verbose,
);
Logger bbLoggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0, printTime: true),
  level: AppConfig.env == EnvTypes.production ? Level.nothing : Level.verbose,
);
