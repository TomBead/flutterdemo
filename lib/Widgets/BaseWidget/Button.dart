import 'package:flutter/material.dart';

class FMButtonVC extends StatefulWidget {
  @override
  FMButtonState createState() => FMButtonState();
}

class FMButtonState extends State<FMButtonVC> {
  var btnEnabled = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: _listView(),
    );
  }

  ListView _listView() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        normalTextButton(),
        OutlinedBtn(),
        ElevatedBtn(),
        _shapeColumn(),
        _statefulColumn(),
        _customColumn(),
      ],
    );
  }

  TextButton normalTextButton() {
    return TextButton(
      onPressed: () {
        print("点击了 button");
      },
      onLongPress: () {
        print("长按了 button");
      },
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        iconColor: Colors.red,
      ),
      child: Text("我是一个按钮"),
    );
  }

  OutlinedButton OutlinedBtn() {
    return OutlinedButton(
      child: Text("OutlinedButton"),
      onPressed: () {},
    );
  }

  ElevatedButton ElevatedBtn() {
    return ElevatedButton(
      child: Text("审核完成"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
        //背景颜色
        foregroundColor: MaterialStateProperty.all(Color(0xff5E6573)),
        //字体颜色
        overlayColor: MaterialStateProperty.all(Color(0xffff0000)),
        // 高亮色
        shadowColor: MaterialStateProperty.all(Color(0xff0088ff)),
        //阴影颜色
        elevation: MaterialStateProperty.all(0),
        //阴影值
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 12)),
        //字体
        side: MaterialStateProperty.all(BorderSide(width: 1, color: Color(0xffCAD0DB))),
        //边框
        shape: MaterialStateProperty.all(StadiumBorder(
            side: BorderSide(
          //设置 界面效果
          style: BorderStyle.solid,
          color: Color(0xffFF7F24),
        ))), //圆角弧度
      ),
      onPressed: () {},
    );
  }

  Column _shapeColumn() {
    return Column(
      children: [
        Container(
          height: 30,
          alignment: Alignment.centerLeft,
          child: Text('shape button'),
        ),
        //第一个
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.grey,
            iconColor: Colors.red,
            shape: const CircleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.red,
                style: BorderStyle.solid,
                // style: BorderStyle.none,
              ),
            ),
          ),
          child: Container(
            height: 100,
            width: 100,
            child: Text('圆的'),
            alignment: Alignment.center,
          ),
          onPressed: () {},
        ),
        Padding(padding: EdgeInsets.all(10)),

        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.green,
            iconColor: Colors.red,
            shape: StadiumBorder(
              side: BorderSide(
                width: 2,
                color: Colors.red,
                // style: BorderStyle.solid,
                style: BorderStyle.none,
              ),
            ),
          ),
          child: Container(
            height: 60,
            width: 200,
            child: Text('球场的'),
            alignment: Alignment.center,
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        //第3个
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.green,
            iconColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 2,
                color: Colors.red,
                style: BorderStyle.solid,
                // style: BorderStyle.none,
              ),
            ),
          ),
          child: Container(
            height: 60,
            width: 200,
            child: Text('圆角的'),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }

  Column _statefulColumn() {
    return Column(
      children: [
        Container(
          height: 30,
          alignment: Alignment.centerLeft,
          child: Text('stateful button'),
        ),
        Padding(padding: EdgeInsets.all(10)),
        TextButton(
          onPressed: btnEnabled ? () {} : null,
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.blue,
            iconColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 2,
                color: Colors.red,
                style: BorderStyle.solid,
                // style: BorderStyle.none,
              ),
            ),
          ),
          child: Text(btnEnabled ? "我现在 enable了" : "我现在 disable 了"),
        ),
        Padding(padding: EdgeInsets.all(10)),
        TextButton(
          onPressed: () {
            btnEnabled = !btnEnabled;
            // 执行该方法会刷新页面
            setState(() {});
          },
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.blue,
            iconColor: Colors.red,
          ),
          child: Text('点我可以控制上边那家伙'),
        ),
      ],
    );
  }

  Column _customColumn() {
    return Column(
      children: [
        Container(
          height: 30,
          alignment: Alignment.centerLeft,
          child: Text('custom button'),
        ),
        Padding(padding: EdgeInsets.all(10)),
        ElevatedButton(
          onPressed: () {},
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg'),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                  child: Image.network(
                      'http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '主标题',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '副标题',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
