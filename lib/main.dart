import 'package:flutter/material.dart';

import 'FMRouteManager.dart';
import 'Widgets/BaseWidget/BaseWidgetList.dart';
import 'Widgets/Cupertino/cupertino_vc.dart';
import 'Widgets/Layout/layout.dart';
import 'Widgets/Material_components/material_components_vc.dart';
import 'Widgets/OtherWidget/OtherWidgetList.dart';

//启动入口,
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FMRouteManager manager = FMRouteManager();
    //这里使用了MaterialApp脚手架，当然也可以使用WidgetApp，建议入口使用MaterialApp。
    //直接定义一个容器布局也可以
    //可以点击title或者home等进去查看MaterialApp的属性
    return MaterialApp(
      title: 'Flutter Demo',
      //主题设置
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //页面和顶部标题
      home: const FMHomeVC(),
      //路由设置
      onGenerateRoute: (setting) {
        return manager.routeWithSetting(setting);
      },
      onUnknownRoute: (setting) {
        return manager.unknowRouteWithSetting(setting);
      },
    );
  }
}

class FMHomeVC extends StatefulWidget {
  const FMHomeVC({super.key});

  @override
  FMHomeState createState() => FMHomeState();
}

class FMHomeState extends State<FMHomeVC> {
  var funcLists = [];

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    funcLists.add({"name": "常见的widget", "desc": "常见的widget"});
    funcLists.add({"name": "其他widget", "desc": "其他widget"});
    funcLists.add({"name": "布局", "desc": "各种页面布局"});
    funcLists.add({"name": "Android 风格页面", "desc": "Android 风格页面"});
    funcLists.add({"name": "ios风格页面", "desc": "ios风格页面"});
    // funcLists.add({"name": "线程", "desc": "Flutter应用的异步模型。"});
    //修改数据
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("Flutter demo"),
        ),
        body: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(15.0),
            // 生成对应数据源数量的 Item
            itemCount: funcLists.length,
            itemBuilder: (context, index) {
              // 按照数据源对每个 Item 进行渲染
              var func = funcLists[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(10.0),
                title: Text(
                  "${func["name"]}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  "${func["desc"]}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  // 点击事件，在这里处理不同 Item 跳转
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          if (func["name"] == "常见的widget") {
                            return FMBaseWidgetVC(func: func);
                          }
                          //
                          else if (func["name"] == "其他widget") {
                            return OtherWidgetVC(func: func);
                          }
                          //
                          else if (func["name"] == "布局") {
                            return FMLayoutVC(func: func);
                          }
                          //
                          else if (func["name"] == "Android 风格页面") {
                            return FMMaterialComponentsVC(func: func);
                          }
                          //
                          else if (func["name"] == "ios风格页面") {
                            return FMCupertinoVC(func: func);
                          }
                          //默认
                          return const Scaffold();
                        },
                        settings: RouteSettings(name: '/materia')),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
