import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  /// 获取文档目录文件
  ///
  ///文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。
  ///只有当应用程序被卸载时，系统才会清除该目录。
  ///在iOS上，这对应于NSDocumentDirectory。
  ///在 Android 上，这是AppData目录。
  /// /data/user/0/com.example.flutterdemo/app_flutter

  static Future<File> getLocalDocumentFile() async {
    final dir = await getApplicationDocumentsDirectory();
    debugPrint('$dir'.toString());
    String filepath = "${dir.path}\\str.txt";
    debugPrint("filepath $filepath");
    // Directory newdirectory = Directory(filepath);//文件夹也可以创建
    File file = File(filepath);
    if (!file.existsSync()) {
      //判断是否存在文件，如果不存在就创建他,异步创建
      file.createSync();
      debugPrint('getLocalDocumentFile create success');
    }

    return File(filepath);
  }

  /// 临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除的临时目录（缓存）。
  /// 在 iOS 上，这对应于NSTemporaryDirectory() (opens new window)返回的值。
  /// 在 Android 上，这是getCacheDir() (opens new window)返回的值。
  /// //'/data/user/0/com.example.flutterdemo/cache'
  static Future<File> getLocalTemporaryFile() async {
    final dir = await getTemporaryDirectory();
    debugPrint('$dir'.toString());
    String filepath = "${dir.path}\\str.txt";
    debugPrint("filepath $filepath");
    // Directory newdirectory = Directory(filepath);//文件夹也可以创建
    File file = File(filepath);
    if (!file.existsSync()) {
      //判断是否存在文件，如果不存在就创建他,异步创建
      file.createSync();
      debugPrint('getLocalTemporaryFile create success');
    }
    return File(filepath);
  }

  static delLocalDocumentFile() async {
    final dir = await getTemporaryDirectory();
    debugPrint('$dir'.toString());
    String filepath = "${dir.path}\\str.txt";
    debugPrint("filepath $filepath");
    // Directory newdirectory = Directory(filepath);//文件夹也可以创建
    File file = File(filepath);
    if (file.existsSync()) {
      //判断是否存在文件，如果不存在就创建他,异步创建
      file.deleteSync();
      debugPrint('delLocalDocumentFile  success');
    }
  }

//
//外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如 SD 卡；
//   由于 iOS 不支持外部目录，所以在 iOS 下调用该方法会抛出UnsupportedError异常，
//   而在 Android 下结果是 android SDK 中getExternalStorageDirectory的返回值。

  /// /data/user/0/com.example.flutterdemo/files
  static Future<File> getLocalSupportFile() async {
    final dir = await getApplicationSupportDirectory();
    debugPrint('$dir'.toString());
    String filepath = "${dir.path}\\str.txt";
    debugPrint("filepath $filepath");
    // Directory newdirectory = Directory(filepath);//文件夹也可以创建
    File file = File(filepath);
    if (!file.existsSync()) {
      //判断是否存在文件，如果不存在就创建他,异步创建
      file.createSync();
      debugPrint('getLocalSupportFile create success');
    }
    return File(filepath);
  }

  /// /data/user/0/com.example.flutterdemo/files
  /// //报错，需要权限
  static Future<File> getExternalStorageDirectory() async {
    final dir = await getExternalStorageDirectory();
    debugPrint('$dir'.toString());
    String filepath = "${dir.path}\\str.txt";
    debugPrint("filepath $filepath");
    // Directory newdirectory = Directory(filepath);//文件夹也可以创建
    File file = File(filepath);
    if (!file.existsSync()) {
      //判断是否存在文件，如果不存在就创建他,异步创建
      file.createSync();
      debugPrint('getExternalStorageDirectory create success');
    }
    return File(filepath);
  }

  //==============================
  /// 读取值
 static Future<void> readString() async {
    try {
      final file = await getLocalDocumentFile();
      final result = await file.readAsString();
      print("result-----$result");

      final file1 = await getLocalTemporaryFile();
      final result1 = await file1.readAsString();
      print("result1-----$result1");

      final file2 = await getLocalSupportFile();
      final result2 = await file2.readAsString();
      print("result2-----$result2");
    } catch (e) {

      print(e.toString());
    }
  }

  /// 写入数据
  static Future<void> writeString(String str) async {
    final file = await getLocalDocumentFile();
    await file.writeAsString(str);

    final file1 = await getLocalTemporaryFile();
    await file1.writeAsString(str);

    final file2 = await getLocalSupportFile();
    await file2.writeAsString(str);
    print("写入成功");
  }
}
