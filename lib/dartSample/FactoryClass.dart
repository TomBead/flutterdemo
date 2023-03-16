//作者：ZJPRENO
//链接：https://juejin.cn/post/7022828622826176526
//来源：稀土掘金
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

//继承
class Student extends Person {
  study() {
    print("好好学习，天天向上");
  }

  //重写方法
  @override
  run() {
    print("Student run..");
  }
}

class Person {
  String? name;
  int? age;
  int? _height;

  //计算属性
  bool get isRight => _height! > 180;

  void setHight(int height) {
    _height = height;
  }

  run() {
    print("run.....");
  }
}

//抽象类
abstract class AbatractClass {
  //抽象方法
  int sum(int a, int b);
}

class SubClass extends AbatractClass {
  @override
  int sum(int a, int b) {
    print(a + b);
    return a + b;
  }
}

//实现接口
class SubClass2 implements AbstractClass, AbstractClass1, AbstractClass2 {
  @override
  int sum(int a, int b) {
    print(a + b);
    return a + b;
  }

  @override
  String? name;

  @override
  int add(int a, int b) {
    print(a + b);
    return a + b;
  }

  @override
  int sub(int a, int b) {
    print(a - b);
    return a - b;
  }
}

abstract class AbstractClass {
  String? name;

  //抽象方法
  int sum(int a, int b);
}

abstract class AbstractClass1 {
  //抽象方法
  int add(int a, int b);
}

abstract class AbstractClass2 {
  //抽象方法
  int sub(int a, int b);
}

//重载操作符
operatorTest() {
  OperatorClass op1 = OperatorClass(20);
  OperatorClass op2 = OperatorClass(18);
  //正常情况下 是不可以比较对象的，需要重载操作符
  print(op1 > op2);
}

class OperatorClass {
  int age;

  OperatorClass(this.age);

  //重载操作符
  bool operator >(OperatorClass other) => this.age > other.age;
}
