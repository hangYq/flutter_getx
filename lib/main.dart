import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx/plugins/plugin.dart';
import 'package:flutter_getx/routes/routes.dart';
import 'package:get/get.dart';

import './utils/local_storage.dart';
import './config/app.dart';
import './utils/logger.dart';

bool isInDebugMode = buildMode == BuildMode.debug;

Future<void> _reportError(dynamic exception, dynamic stackTrace) async {
  if (isInDebugMode) {
    logger.e(stackTrace);
    logger.i('In dev mode. Not sending report to Server');
    return;
  }

  // todo: upload error
}

Future<void> main() async {
  try {
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (isInDebugMode) {
        FlutterError.dumpErrorToConsole(details);
        return;
      }
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    };

    // init shared_preferences
    await DenpendencyInjection.init();
  } catch (e) {
    logger.e(e);
  }

  // https://docs.flutter.dev/release/breaking-changes/zone-errors
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const MyApp());
    },
    _reportError,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final PluginTest plugin = PluginTest();
    plugin.registerCallback('timer', receiverNative);
    logger.d('sub initState');
  }

  void receiverNative(dynamic result) {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    logger.d('didChangeAppLifecycleState');
    if (state == AppLifecycleState.resumed) {
      logger.d('resumed：');
    } else if (state == AppLifecycleState.inactive) {
      logger.d('inactive');
    } else if (state == AppLifecycleState.paused) {
      logger.d('paused');
    } else if (state == AppLifecycleState.detached) {
      logger.d('detached');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.tabs,
      getPages: AppRoutes.routes,
    );
  }
}
