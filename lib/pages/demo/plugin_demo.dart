import 'dart:async';

import 'package:flutter/material.dart';

import '../../plugins/plugin.dart';

class PluginDemoPage extends StatefulWidget {
  const PluginDemoPage({super.key});

  @override
  State<PluginDemoPage> createState() => _PluginDemoPageState();
}

class _PluginDemoPageState extends State<PluginDemoPage> {
  String? nativeResult;
  String? receiverResult;
  String? basicMessageResult;
  dynamic eventChannelResult;
  StreamSubscription<dynamic>? subscription;
  String message = '';
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    final PluginTest plugin = PluginTest();
    plugin.registerCallback('timer', receiverNative);
    plugin.registerCallback('sms', receiverMessage);
    plugin.registerCallback('phone', receiverPhoneInfo);
    subscription = plugin.onProgress(_onData);
  }

  void _onData(dynamic event) {
    setState(() {
      eventChannelResult = event;
    });
  }

  @override
  void dispose() {
    super.dispose();
    final PluginTest plugin = PluginTest();
    plugin.unregisterCallback('timer');
    plugin.unregisterCallback('sms');
    plugin.unregisterCallback('phone');
    subscription?.cancel();
  }

  void receiverMessage(dynamic result) {
    setState(() {
      message = '$result';
    });
  }

  void receiverPhoneInfo(dynamic result) {
    setState(() {
      phoneNumber = '$result';
    });
  }

  void receiverNative(dynamic result) {
    setState(() {
      receiverResult = '$result';
    });
  }

  Future<void> sendDataToNative() async {
    final PluginTest plugin = PluginTest();
    final Map<dynamic, dynamic>? result = await plugin.sendDataToNative(
      <String, dynamic>{
        'name': 'tom',
        'age': '20',
      },
    );
    setState(() {
      nativeResult = '$result';
    });
  }

  Future<void> sendBasicMessage() async {
    final PluginTest plugin = PluginTest();
    final Map<dynamic, dynamic>? result = await plugin.sendBasicMessage(
      <String, dynamic>{
        'name': 'tom',
        'age': '20',
      },
    );
    setState(() {
      basicMessageResult = '$result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          OutlinedButton(
            onPressed: sendDataToNative,
            child: Text('sendDataToNative'),
          ),
          Text('Native 返回的数据:$nativeResult'),
          Text('Native 主动调用 Flutter 返回的数据:$receiverResult'),
          OutlinedButton(
            onPressed: sendBasicMessage,
            child: Text('SendBasicMessage'),
          ),
          Text('basicMessageResult 返回的数据:$basicMessageResult'),
          Text('eventChannel 返回的数据:$eventChannelResult'),
          Text('短信信息:$message'),
          Text('来电信息:$phoneNumber'),
        ],
      ),
    );
  }
}
