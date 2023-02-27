import 'package:flutter/material.dart';

class FMMaterialComponentsVC extends StatefulWidget {
  final func;

  const FMMaterialComponentsVC({super.key, @required this.func});

  @override
  FMMaterialComponentsState createState() => FMMaterialComponentsState();
}

class FMMaterialComponentsState extends State<FMMaterialComponentsVC> {
  var funcLists = [];

  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    funcLists.add({
      "name": "Scaffold",
      "action": "/MaterialComponents/Scaffold",
      "desc": "Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。"
    });
    funcLists.add(
        {"name": "Appbar", "action": "/MaterialComponents/AppBar", "desc": "在水平方向上排列子widget的列表。"});
    funcLists.add({
      "name": "BottomNavigationBar",
      "action": "/MaterialComponents/BottomNavigationBar",
      "desc": "底部导航条，可以很容易地在tap之间切换和浏览顶级视图。"
    });
    funcLists.add({
      "name": "TabBar",
      "action": "/MaterialComponents/TabBar",
      "desc": "一个显示水平选项卡的Material Design widget。"
    });
    funcLists.add({
      "name": "TabBarView",
      "action": "/MaterialComponents/TabBarView",
      "desc": "显示与当前选中的选项卡相对应的页面视图。通常和TabBar一起使用。"
    });
    funcLists.add({
      "name": "MaterialApp",
      "action": "/MaterialComponents/MaterialApp",
      "desc": "一个方便的widget，它封装了应用程序实现Material Design所需要的一些widget。"
    });

    funcLists.add({
      "name": "PopupMenuButton",
      "action": "/MaterialComponents/PopupMenuButton",
      "desc": "当菜单隐藏式，点击或调用onSelected时显示一个弹出式菜单列表。"
    });

    funcLists.add(
        {"name": "FocusNode", "action": "/MaterialComponents/FocusNode", "desc": "文本输入框的焦点控制。"});
    funcLists.add({
      "name": "Date & Time Pickers",
      "action": "/MaterialComponents/DatePicker",
      "desc": "日期&时间选择器。"
    });

    funcLists.add(
        {"name": "Dialog", "action": "/MaterialComponents/Dialog", "desc": "简单对话框可以显示附加的提示或操作。"});

    funcLists.add({
      "name": "BottomSheet",
      "action": "/MaterialComponents/BottomSheet",
      "desc": "BottomSheet是一个从屏幕底部滑起的列表（以显示更多的内容）。你可以调用showBottomSheet()或showModalBottomSheet弹出。"
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
                var func = funcLists[index];
                return ListTile(
                  title: Text(
                    "${func["name"]}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    "${func["desc"]}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                  onTap: () {
                    print("${func}");
                    Navigator.pushNamed(context, "${func["action"]}");
                  },
                );
              }),
        ),
      ),
    );
  }
}
