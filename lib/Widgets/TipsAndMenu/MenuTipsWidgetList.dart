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
    funcLists.add({
      "name": "PopupMenuButton 弹出菜单",
      "action": "/MaterialComponents/PopupMenuButton",
      "desc": "Material Design PopupMenuButton 。"
    });

    funcLists.add({
      "name": "DatePicker",
      "action": "/MaterialComponents/DatePicker",
      "desc": "Material Design DatePicker 。"
    });

    funcLists.add({
      "name": "Dialog",
      "action": "/MaterialComponents/Dialog",
      "desc": "Material Design Dialog 。"
    });
    funcLists.add({
      "name": "BottomSheet",
      "action": "/MaterialComponents/BottomSheet",
      "desc": "Material Design BottomSheet 底部弹窗。"
    });

    funcLists.add({
      "name": "SnackBar",
      "action": "/MaterialComponents/SnackBar",
      "desc": "Material Design SnackBar 底部提示。"
    });

    funcLists.add({
      "name": "Stepper",
      "action": "/MaterialComponents/Stepper",
      "desc": "Material Design Stepper 。"
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
