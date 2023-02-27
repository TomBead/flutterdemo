import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FMTextVC extends StatelessWidget {
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Text",
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          child: _listView(),
        ),
      ),
    );
  }

  ListView _listView() {
    return ListView(
      children: [
        _normalText(),
        _richText(),
        txtTap(),
      ],
    );
  }

  Container txtTap() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      color: Colors.green[500],
      child: GestureDetector(
        child: const Text(
          "点击事件txt",
          style: TextStyle(color: Colors.white, fontSize: 18.0, backgroundColor: Colors.orange),
        ),
        onTap: () {
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    );
  }

  Text _normalText() {
    return Text(
      "Hello World",
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 50,
        color: Colors.red,
        decoration: TextDecoration.underline,
        decorationColor: Colors.yellow,
        decorationStyle: TextDecorationStyle.double,
      ),
    );
  }

  Text _richText() {
    return Text.rich(
      TextSpan(
        text: "Just ",
        style: TextStyle(
          fontSize: 30,
        ),
        children: [
          TextSpan(
            text: "taps here",
            style: TextStyle(fontSize: 40, color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("点击了");
              },
          ),
          TextSpan(
            text: " one more time",
          ),
        ],
      ),
    );
  }
}
