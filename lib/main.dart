import 'package:flutter/material.dart';

//导入其他文件的包
import 'package:flutterdemo/pageTest1.dart';
import 'mainLvPage.dart';
import 'mainPage.dart';

//void main()为入口方法,main.dart文件独有
void main() {
  // runApp(const MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FMHomeVC(),
    );
  }
}
