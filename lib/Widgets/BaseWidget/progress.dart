import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FMProgress extends StatefulWidget {
  @override
  FMProgressState createState() => FMProgressState();
}

class FMProgressState extends State<FMProgress> {
  double _count = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    initTimer();
  }

  void initTimer() {
    // 一直轮播的定时器
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _count += 0.1;
      if (_count > 100) {
        _count = 0;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 页面销毁时一定要 cancel 掉定时器，不然会一直执行
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress"),
      ),
      body: _column(),
    );
  }

  Column _column() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("一直动的进度条"),
        ),
        LinearProgressIndicator(),
        Padding(padding: EdgeInsets.all(20)),
        Container(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("自定义样式与进度的进度条"),
        ),
        _Progress(),
        Padding(padding: EdgeInsets.all(20)),
        Container(
          width: 100,
          height: 100,
          child: _circularProgressIndicator(),
        ),
        _cupertinoActivityIndicator(true),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("ios 进度加载"),
        ),
      ],
    );
  }

  LinearProgressIndicator _Progress() {
    return LinearProgressIndicator(
      value: _count / 100.0, // 当前进度
      backgroundColor: Colors.yellow, // 进度条背景色
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red), // 进度条当前进度颜色
      minHeight: 10, // 最小宽度
    );
  }

  CircularProgressIndicator _circularProgressIndicator() {
    return CircularProgressIndicator(
      value: _count / 100.0, // 当前进度
      strokeWidth: 10, // 最小宽度
      backgroundColor: Colors.yellow, // 进度条背景色
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red), // 进度条当前进度颜色
    );
  }

  //ios风格进度条
  CupertinoActivityIndicator _cupertinoActivityIndicator(animating) {
    return CupertinoActivityIndicator(
      animating: animating,
      radius: 30,
    );
  }
}
