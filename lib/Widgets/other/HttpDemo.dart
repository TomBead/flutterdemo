import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'HttpManager.dart';

class HttpDemo extends StatefulWidget {
  @override
  HttpDemoState createState() => HttpDemoState();
}

class HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    HttpManager httpManager = HttpManager();
    Dio _dio = httpManager.dio;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("网络请求"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //请求完成
                if (snapshot.connectionState == ConnectionState.done) {
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  Response response = snapshot.data;
                  //请求成功，通过项目信息构建用于显示项目名称的ListView
                  return ListView(
                    children: response.data
                        .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                        .toList(),
                  );
                }
                //请求未完成时弹出loading
                return CircularProgressIndicator();
              }),
        ));
  }
}
