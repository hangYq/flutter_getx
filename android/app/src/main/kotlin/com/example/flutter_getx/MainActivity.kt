package com.example.flutter_getx

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)
		MethodChannelTest(this,flutterEngine.dartExecutor.binaryMessenger)
		BasicMessageChannelTest(flutterEngine.dartExecutor.binaryMessenger)
		EventChannelTest(this,flutterEngine.dartExecutor.binaryMessenger)
	}
}
