import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'FileManager.dart';

class CallAndroidDemo extends StatefulWidget {
  @override
  CallAndroidDemoState createState() => CallAndroidDemoState();
}

class CallAndroidDemoState extends State<CallAndroidDemo> {
  //
  static const platform = MethodChannel('samples.flutter.io/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("调用原生方法"),
      ),
      body: _listView(),
    );
  }

  ListView _listView() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        createFileBtn(),
        Text(_batteryLevel),
      ],
    );
  }

  OutlinedButton createFileBtn() {
    return OutlinedButton(
      child: Text("调用方法"),
      onPressed: () {
        _getBatteryLevel();
      },
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
