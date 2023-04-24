import 'package:flutter/material.dart';

class OtherFunList extends StatefulWidget {
  final func;

  const OtherFunList({super.key, @required this.func});

  @override
  OtherFunListState createState() => OtherFunListState();
}

class OtherFunListState extends State<OtherFunList> {
  var funcLists = [];

  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    funcLists.add({"name": "路由", "action": "/other/route", "desc": "路由功能 "});
    funcLists.add({"name": "切换主题", "action": "/other/ThemeTestRoute", "desc": "切换主题 "});

    funcLists.add({"name": "文件操作", "action": "/other/file", "desc": "文件操作 "});
    funcLists.add({"name": "网络请求", "action": "/other/http", "desc": "网络请求 "});
    //还不行
    funcLists.add({"name": "调用Android原生代码", "action": "/other/android", "desc": "调用Android原生代码 "});
    //微信分享
    funcLists.add({"name": "微信分享", "action": "/other/wxshear", "desc": "微信分享 "});

    //不起作用？
    // funcLists.add({"name": "导航栏拦截", "action": "/other/willpop", "desc": "按两次返回键退出"});
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
          title: Text("${widget.func["name"]}"),
        ),
        body: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(15.0),
              itemCount: funcLists.length,
              itemBuilder: (context, index) {
                var item = funcLists[index];
                return ListTile(
                  title: Text(
                    "${item["name"]}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    "${item["desc"]}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {
                    print("${item}");
                    Navigator.pushNamed(context, "${item["action"]}");
                  },
                );
              }),
        ),
      ),
    );
  }
}
