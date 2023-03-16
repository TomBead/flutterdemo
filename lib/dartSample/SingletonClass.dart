
//单例
// SingletonClass sl = SingletonClass();
// sl.doWork()
class SingletonClass {
  //保存单例
  static final SingletonClass _instance = SingletonClass._init();

  //私有的构造函数
  SingletonClass._init();

  //工厂构造函数
  factory SingletonClass() => _instance;

  void doWork() {
    print("Do work");
  }
}
