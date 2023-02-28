//路由测试
import 'package:flutter/material.dart';

//
class FristPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //主题设置
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //页面和顶部标题
      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //名为"/"的路由作为应用的home(首页)
      // initialRoute:"/",
      //注册路由表
      // routes:{
      //   "new_page":(context) => NewRoute(),
      // } ,
      //------------------------------------------
      //路由设置，如果使用 Navigator.pushNamed(context, "xx");方法会回调到这里
      //onGenerateRoute属性，它在打开命名路由时可能会被调用，之所以说可能，
      //是因为当调用Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；
      //如果路由表中没有注册，才会调用onGenerateRoute来生成路由
      // onGenerateRoute: (setting) {
      //   return manager.routeWithSetting(setting);
      // },
      // onUnknownRoute: (setting) {
      //   return manager.unknowRouteWithSetting(setting);
      // },
    );
  }
}

//使用StatefulWidget有状态Widget
//有状态的Widget才能修改，无状态的不能修改？
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  //创建State状态
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold布局脚手架组件
    return Scaffold(
      //头部，设置
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //
      body: Center(
        child: Column(
          //位置居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
              child: Text("open new route"),
            ),

            //路由传值
            OutlinedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //页面传值
                      return TipRoute(
                          // 路由参数
                          text: "我是提示xxxx");
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                print("路由返回值============: $result");
                //----------------------------
              },
              child: Text("打开提示页"),
            ),
          ],
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

//路由传值
class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text, // 接收一个text参数
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    //传值这么写
    //Navigator.of(context).pushNamed("new_page", arguments: "hi");
    //获取值这么写
    var args = ModalRoute.of(context)?.settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              OutlinedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
