import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FMSwitchVC extends StatefulWidget {
  @override
  FMSwitchState createState() => FMSwitchState();
}

class FMSwitchState extends State<FMSwitchVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Column(
        children: [
          _switch(),
          Text(
            "material风格 Switch",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          _cupertinoSwitch(),
          Text(
            "ios 风格Normal Switch",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          _customSwitch(),
          Text(
            "ios 自定义 Switch",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  bool switchValue = true;
  bool _switchValue = false;

  Switch _switch() {
    return Switch(
        value: switchValue,
        activeColor: Colors.white,
        activeTrackColor: Colors.grey,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.green,
        activeThumbImage: NetworkImage("https://activeThumbImage"),
        inactiveThumbImage: NetworkImage("https://inactiveThumbImage"),

        // activeThumbImage: AssetImage('images/base_widgets/bear_white.png'),
        // inactiveThumbImage: AssetImage('images/base_widgets/bear_brown.png'),

        onActiveThumbImageError: (error, stack) {
          print("onActiveThumbImageError = $error");
        },
        onInactiveThumbImageError: (error, stack) {
          print("onInactiveThumbImageError = $error");
        },
        onChanged: (value) {
          switchValue = !switchValue;
          print(value);
          setState(() {});
        });
  }

  SafeArea _safeArea() {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Normal Switch",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          _cupertinoSwitch(),
          Text(
            "Custom Switch",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          _customSwitch(),
        ],
      ),
    );
  }

  CupertinoSwitch _cupertinoSwitch() {
    return CupertinoSwitch(
      // 当前 switch 的开关
      value: _switchValue,
      // 点击或者拖拽事件
      onChanged: (value) {
        _switchValue = value;

        setState(() {});
      },
    );
  }

  CupertinoSwitch _customSwitch() {
    return CupertinoSwitch(
      // 当前 switch 的开关
      value: _switchValue,
      activeColor: Colors.red,
      // 开关打开时，轨道颜色
      trackColor: Colors.yellow,
      // 开关关闭时，轨道颜色
      dragStartBehavior: DragStartBehavior.down,
      // 拖拽效果，默认为 start 更为平滑，为 down 时有明显吸附效果
      onChanged: (value) {
        _switchValue = value;

        setState(() {});
      },
    );
  }
}
