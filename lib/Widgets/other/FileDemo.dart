import 'package:flutter/material.dart';
import 'FileManager.dart';

class FileDemo extends StatefulWidget {
  @override
  FileDemoState createState() => FileDemoState();
}

class FileDemoState extends State<FileDemo> {
  var btnEnabled = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: _listView(),
    );
  }

  ListView _listView() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        createFileBtn(),
        delBtn(),
        writeBtn(),
        readFile(),
      ],
    );
  }

  OutlinedButton createFileBtn() {
    return OutlinedButton(
      child: Text("创建文件"),
      onPressed: () {
        FileManager.getLocalDocumentFile();
        FileManager.getLocalTemporaryFile();
        FileManager.getLocalSupportFile();
        // FileManager.getExternalStorageDirectory();
      },
    );
  }

  OutlinedButton delBtn() {
    return OutlinedButton(
      child: Text("删除文件"),
      onPressed: () {
        FileManager.delLocalDocumentFile();
      },
    );
  }

  OutlinedButton writeBtn() {
    return OutlinedButton(
      child: Text("写入数据"),
      onPressed: () {
        FileManager.writeString("写入的文字=====");
      },
    );
  }

  OutlinedButton readFile() {
    return OutlinedButton(
      child: Text("读取文件"),
      onPressed: () {
        FileManager.readString();
      },
    );
  }
}
