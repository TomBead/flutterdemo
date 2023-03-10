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
