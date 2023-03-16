import 'package:flutter/material.dart';

class OtherWidgetVC extends StatefulWidget {
  final func;

  const OtherWidgetVC({super.key, @required this.func});

  @override
  OtherWidgetState createState() => OtherWidgetState();
}

class OtherWidgetState extends State<OtherWidgetVC> {
  var funcLists = [];

  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    funcLists.add({"name": "Icon", "action": "widget/Icon", "desc": "A Material Design icon. "});
    funcLists.add({
      "name": "IconButton 图片按钮",
      "action": "/MaterialComponents/IconButton",
      "desc": "Material Design  。"
    });
    funcLists.add({
      "name": "CustomScrollViewTest 滚动view容器",
      "action": "/MaterialComponents/CustomScrollViewTest",
      "desc": "可以装下 listview和gridview的容器"
    });

    funcLists.add({
      "name": "Appbar",
      "action": "/Material/Appbar",
      "desc": "一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。"
    });
    funcLists.add({
      "name": "Slider",
      "action": "/MaterialComponents/Slider",
      "desc": "Material Design Slider 滑动条。"
    });

    funcLists.add({
      "name": "BottomNavigationBar",
      "action": "/MaterialComponents/BottomNavigationBar",
      "desc": "Material Design BottomNavigationBar 底部按钮。"
    });

    funcLists.add({
      "name": "TabBar",
      "action": "/MaterialComponents/TabBar",
      "desc": "Material Design 顶部选项tab 。"
    });

    funcLists.add({
      "name": "TabBarView",
      "action": "/MaterialComponents/TabBarView",
      "desc": "Material Design 顶部选项tab TabBarView 。"
    });

    //
    funcLists.add({
      "name": "FloatingActionButton",
      "action": "/MaterialComponents/FloatingActionButton",
      "desc": "Material Design FloatingActionButton 浮动按钮。"
    });

    funcLists.add(
        {"name": "Radio", "action": "/MaterialComponents/Radio", "desc": "Material Design 选项组 。"});

    funcLists.add({
      "name": "ExpansionPanel",
      "action": "/MaterialComponents/ExpansionPanel",
      "desc": "Material Design 折叠列表 。"
    });

    funcLists.add({
      "name": "SnackBar",
      "action": "/MaterialComponents/SnackBar",
      "desc": "Material Design 底部弹出提示 。"
    });
    funcLists.add(
        {"name": "Chip", "action": "/MaterialComponents/Chip", "desc": "Material Design Chip 。"});

    funcLists.add({
      "name": "ToolTip",
      "action": "/MaterialComponents/ToolTip",
      "desc": "Material Design 点击提示框 。"
    });
    funcLists.add({
      "name": "DataTable",
      "action": "/MaterialComponents/DataTable",
      "desc": "Material Design 表格 。"
    });
    funcLists.add(
        {"name": "Card", "action": "/MaterialComponents/Card", "desc": "Material Design 卡片布局。带阴影"});
    funcLists.add({
      "name": "Stepper",
      "action": "/MaterialComponents/Stepper",
      "desc": "Material Design 步骤选择显示 。"
    });

    funcLists.add({
      "name": "Divider",
      "action": "/MaterialComponents/Divider",
      "desc": "Material Design 分割线 。"
    });

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
