import 'dart:io';

///异步例子
/// dart 是单线程
class AsyncDemo {
  void testSync() {
    //1.直接执行
    // print("main function start");
    // print(getNetworkData());
    // print("main function end");

    //2.异步执行
    // print("main function start");
    // // 使用变量接收getNetworkData返回的future
    // var future = getNetworkData();
    // // 当future实例有返回结果时，会自动回调then中传入的函数
    // // 该函数会被放入到事件循环中，被执行
    // future.then((value) {
    //   print(value);
    // });
    // print(future);
    // print("main function end");

    //3.异常
    // print("main function start");
    // var future = getNetworkData();
    // future.then((value) {
    //   print(value);
    // }).catchError((error) { // 捕获出现异常时的情况
    //   print(error);
    // });
    // print(future);
    // print("main function end");
  }

  // String getNetworkData() {
  //   //主线程会停止3s
  //   sleep(Duration(seconds: 3));
  //   return "network data";
  // }

  Future<String> getNetworkData() {
    return Future<String>(() {
      sleep(Duration(seconds: 3));
      return "network data";
    });
  }

  Future<String> getNetworkDataWithError() {
    return Future<String>(() {
      sleep(Duration(seconds: 3));
      // 不再返回结果，而是出现异常
      // return "network data";
      throw Exception("网络请求出现错误");
    });
  }

  ///
  /// 通用写法
  /// 1.一旦有了await这个关键字，那么这个操作就会等待Future.delayed的执行完毕，并且等待它的结果。
  /// 2.await关键字必须存在于async函数中。 给方法后面加一个async
  ///
  ///
  ///
  ///
  Future<String> getNetworkDataSample() async {
    var result = await Future.delayed(Duration(seconds: 3), () {
      return "network data";
    });

    return "请求到的数据：$result";
  }
}
