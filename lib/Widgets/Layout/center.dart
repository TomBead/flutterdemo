import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Center'),
      ),
      body: Container(
        width: 400,
        height: 600,
        color: Colors.grey,
        child: centerTest(),
      ),
    );
  }

  /**
   * 不能设置颜色？
   */
  Center centerTest() {
    return const Center(
      // widthFactor：如果不设置Center的宽度将尽可能大的填充，如果设置后Center的宽度即为子部件的宽度乘以widthFactor的设置值
      widthFactor: 10.5,
      // heightFactor：如果不设置Center的高度将尽可能大的填充，如果设置后Center的高度即为子部件的宽度乘以heightFactor的设置值
      heightFactor: 10.0,
      child: Text(
        "点击事件txt",
        style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
      ),
    );
  }
}
