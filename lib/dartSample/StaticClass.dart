class StaticClass {


  // 静态属性
  static String name = "reno";
  int height = 180;
  int count = 0;

  //静态方法
  static setName(String name1) {
    name = name1;
    return name;
  }

  //实例方法
  int sum(int a) {
    return a + count + height; //实例方法可以访问，非静态成员和静态成员
  }
}
