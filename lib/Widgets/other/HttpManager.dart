import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

// dio 使用文档
// https://github.com/cfug/dio/blob/main/dio/README-ZH.md
//单例
// SingletonClass sl = SingletonClass();
// sl.doWork()
class HttpManager {
  //保存单例
  static final HttpManager _instance = HttpManager._init();

  //私有的构造函数
  HttpManager._init();

  //工厂构造函数
  factory HttpManager() => _instance;

  final dio = Dio(
    BaseOptions(
      /// 请求路径，如果以 http(s)开始, 则 [baseURL] 会被忽略，
      /// 否则将会和 [baseUrl] 拼接出完整的地址。
      baseUrl: 'https://api.pub.dev',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  void addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          // 如果你想终止请求并触发一个错误,你可以使用 `handler.reject(error)`。
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // 如果你想终止请求并触发一个错误,你可以使用 `handler.reject(error)`。
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          return handler.next(e);
        },
      ),
    );
  }

  //get方法
  void getRequest() async {
    Response response;
    response = await dio.get('/test?id=12&name=dio');
    print(response.data.toString());
    // The below request is the same as above.
    response = await dio.get(
      '/test',
      queryParameters: {'id': 12, 'name': 'dio'},
    );
    print(response.data.toString());
  }

  //post 方法
  void postRequest() async {
    Response response;
    response = await dio.post('/test', data: {'id': 12, 'name': 'dio'});
  }

  //下载文件
  void downLoadRequest() async {
    Response response;

    /// 请求路径，如果以 http(s)开始, 则 [baseURL] 会被忽略，
    /// 否则将会和 [baseUrl] 拼接出完整的地址。
    response = await dio.download(
      'https://www.google.com/',
      '${(await getTemporaryDirectory()).path}google.html',
      //下载进度
      onReceiveProgress: (a, b) => print('received ${a / b}'),
    );
  }

  //使用 application/x-www-form-urlencoded 编码
  //默认情况下, Dio 会将请求数据（除了 String 类型）序列化为 JSON。
  // 如果想要以 application/x-www-form-urlencoded 格式编码, 你可以设置 contentType :
  void postContentType() {
    // Instance level
    dio.options.contentType = Headers.formUrlEncodedContentType;
  // or only works once
    dio.post(
      '/info',
      data: {'id': 5},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
  }

  //发送 formData
  // Dio 支持发送 FormData, 请求数据将会以 multipart/form-data 方式编码, FormData 中可以包含一个或多个文件。
  void postFormData() async {
    final formData = FormData.fromMap({
      'name': 'dio',
      'date': DateTime.now().toIso8601String(),
    });
    final response = await dio.post('/info', data: formData);
  }

  //使用formData 上传文件
  void uPLoadFile() async {
    final formData = FormData.fromMap({
      'name': 'dio',
      'date': DateTime.now().toIso8601String(),
      'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      'files': [
        await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
        await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      ]
    });
    final response = await dio.post(
      '/info',
      data: formData,
      //上传进度
      onSendProgress: (int sent, int total) {
        print('$sent $total');
      },
    );
  }
}

///
///自定义拦截器例子
///
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future? onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
    return null;
  }
}
