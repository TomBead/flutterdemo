import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
      ),
      body: Container(
        width: 400,
        height: 600,
        color: Colors.grey,
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      children: [
        Padding20(),
        Padding40(),
        Padding60(),
      ],
    );
  }

  Padding Padding20() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        "点击事件txt",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }

  Padding Padding40() {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Text(
        "点击事件txt",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }

  Padding Padding60() {
    return Padding(
      padding: EdgeInsets.only(
        left: 60,
        right: 0,
        top: 0,
        bottom: 0,
      ),
      child: Text(
        "点击事件txt",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }
}
