/*
 * 类
 */
class DartSample {
  //常量
  static const int id = 30061111111888888;

  //方法，调用方法
  // DartSample dartSample = DartSample();
  // dartSample.testVarFinal();
  void testVarFinal() {
    //自动转化类型
    var a; //变量
    a = "this is a !";
    print(a);
    a = 100;
    print(a);
    print(a + 10);
    print(a - 10);
    //final赋值之后无法改变
    final b;
    b = "hello";
    //无法改变，初始化就赋值
    const c = 10;
  }

  //double 类型的可以赋值 int 整型， int 类型的不可以赋double。
  void numTest() {
    //number 数值型 int 和 double
    num a = 1;
    print(a);
    a = 3.4;
    print(a);

    int b = 4;
    print(b);

    double c = 3; //相当于 3.0
    print(c);

    //int类型才能调用
    print(b.isEven); //是否偶数
    print(b.isOdd); //是否奇数

    print(b ~/ c); //取整，4/3取整=1
  }

  void stingTest() {
    var a = 'jay';
    var b = "reno";
    print(a + b);
    //占位符，引用
    print("a+b=${a + b}");

    String name = 'reno';
    print(name);
    //直接获取下标
    print(name[1]);
    //Dart中判断字符串内容是否相等是用‘==’号，而Java中是使用equals()方法
    String str1 = "aaaa";
    String str2 = 'bbbb';
    print(str1 == str2);
  }

  void listTest() {
    // 直接 list创建
    List a = ["1", 2, "3.0", 4.0];
    print(a);
    // var 创建
    var list = [1, 2, "zjp", 3.0];
    print(list);

    //直接获取指定下标数据
    print(list[3]);
    //直接修改指定下标数据
    list[3] = "reno";
    //插入
    list.insert(1, "hellow");
    //list.insert(index, element)
    //删除
    list.remove(1);
    print(list);
    //排序
    list.sort();
    print(list);
    //清空
    list.clear();
  }

  void mapTest() {
    Map a = {"a": 1, "b": 2};
    print(a);

    var a1 = {"a1": 1, "a2": 2};
    print(a1);

    print(a["a"]); //取值
    a["a"] = "aa"; //改值
    print(a["a"]);

    //map长度
    print(a.length);

    //获取所有的 key
    print(a.keys);
    //获取所有的 values
    print(a.values);
  }

  // 求和方法
  sum(a, b) {
    return a + b;
  }

  // 求和方法，和上面是一样的，省略掉大括号
  sum1(a, b) => a + b;

  //可选参数
  //print(sum1(1,2,3));
  //print(sum1(1,c:2,b:3));
  //print(sum1(1,b:3));
  sum3(int a, {b, c}) {
    b ??= 1;
    c ??= 2;
    return a + b + c;
  }

  //方法作为参数
  void functionTest() {
    var hello = jpHello();
    hello(); //可以直接调用
    //
    var list = [1, 2, 3, 4, 5];
    // list.forEach(print);
    forEachTest(list, print);
  }

  jpHello() {
    print("hello reno");
  }

  //自定义一个 forEach
  forEachTest(List list, void func(var element)) {
    for (var e in list) func(e);
  }

  void closureTest() {
    //闭包 closure
    // 定义在函数里面的函数就是闭包，闭包也是一个对象
    // 闭包的作用：可以访问外部函数的局部变量;
    var funcA = funcTest();
    funcA();
    funcA();
    funcA();
  }

  funcTest() {
    int a = 0;
    return () => print(a++); //这个是匿名函数，其他就是一个闭包
  }
}
