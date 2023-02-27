import 'package:flutter/material.dart';

class FMBaseWidgetVC extends StatefulWidget {
  final func;

  const FMBaseWidgetVC({super.key, @required this.func});

  @override
  FMBaseWidgetState createState() => FMBaseWidgetState();
}

class FMBaseWidgetState extends State<FMBaseWidgetVC> {
  var funcLists = [];

  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    funcLists.add({"name": "Text", "action": "widget/Text", "desc": "显示文本"});
    funcLists.add({"name": "Image", "action": "widget/Image", "desc": "显示图片的widget。"});
    //按钮
    funcLists.add({"name": "Button", "action": "widget/Button", "desc": "3种常用按钮"});
    //输入框
    funcLists.add({"name": "TextField", "action": "widget/TextField", "desc": "输入框"});
    //开关
    funcLists.add({"name": "Switch", "action": "widget/Switch", "desc": "Material Design风格 开关按钮。"});
    //勾选框
    funcLists.add({"name": "CheckBox", "action": "widget/CheckBox", "desc": "复选框，允许用户从一组中选择多个选项。"});
    //列表
    funcLists.add({"name": "Listview", "action": "widget/Listview", "desc": "列表类似listview"});
    //进度条
    funcLists.add({"name": "Progress", "action": "widget/Progress", "desc": "进度条和加载中显示"});

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
