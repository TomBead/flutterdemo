
//单例
// SingletonClass sl = SingletonClass();
// sl.doWork()
class SingletonClass {
  //保存单例
  static final SingletonClass _instance = SingletonClass._init();

  //私有的构造函数
  SingletonClass._init();

  //工厂构造函数
  //factory 关键字，获取已经存在的对像
  factory SingletonClass() => _instance;

  void doWork() {
    print("Do work");
  }
}
