import 'package:flutter/material.dart';

class FMLayoutVC extends StatefulWidget {
  final func;

  const FMLayoutVC({super.key, @required this.func});

  @override
  FMLayoutState createState() => FMLayoutState();
}

class FMLayoutState extends State<FMLayoutVC> {
  var funcLists = [];

  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    // 帧布局
    funcLists.add({"name": "Stack", "action": "/Layout/Stack", "desc": "可以允许其子widget简单的堆叠在一起 "});
    funcLists.add(
        {"name": "Container", "action": "/Layout/Container", "desc": "一个拥有绘制、定位、调整大小的 widget。 "});
    // 多个子元素布局
    funcLists.add({"name": "Row", "action": "/Layout/Row", "desc": "在水平方向上排列子widget的列表。"});
    funcLists.add({"name": "Column", "action": "/Layout/Column", "desc": "在垂直方向上排列子widget的列表。"});
    funcLists.add({"name": "Flow", "action": "/Layout/Flow", "desc": "一个实现流式布局算法的widget "});

    funcLists.add(
        {"name": "Padding", "action": "/Layout/Padding", "desc": "一个widget, 会给其子widget添加指定的填充 "});
    funcLists.add({
      "name": "Align",
      "action": "/Layout/Align",
      "desc": "一个widget，它可以将其子widget对齐，并可以根据子widget的大小自动调整大小。"
    });
    funcLists
        .add({"name": "Center", "action": "/Layout/Center", "desc": "将其子widget居中显示在自身内部的widget "});
    //调用刷新页面
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
