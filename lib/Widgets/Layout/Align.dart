import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
      ),
      body: Container(
        width: 400,
        height: 400,
        color: Colors.grey,
        child: _listView(),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      children: [
        alignTest(),
        alignTest1(),
        alignTest2(),
      ],
    );
  }

  /**
   *
   *
   */
  Align alignTest() {
    return const Align(
      alignment: Alignment.topLeft,
      widthFactor: 2.0,
      heightFactor: 2.0,
      child: Text(
        "Alignment.topLeft",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }

  Align alignTest1() {
    return const Align(
      alignment: Alignment.centerLeft,
      widthFactor: 2.0,
      heightFactor: 2.0,
      child: Text(
        "Alignment.centerLeft",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }

  Align alignTest2() {
    return const Align(
      alignment: Alignment.bottomRight,
      widthFactor: 1.0,
      heightFactor: 8.0,
      child: Text(
        "Alignment.bottomRight",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }
}
