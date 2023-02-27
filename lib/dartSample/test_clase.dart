class JPPerson {
  final String nationality;

  //下划线开头是私有的
  //没有加下划线的开头的就是可以外部访问的
  String? _name;
  int? height;
  int? _age;



  // JPPerson(int age, String name) {
  //   _age = age;
  //   _name = name;
  // }

  //构造方法只能有一个？
  JPPerson(this._age, this.nationality, this.height); //构造方法

  void _info() {
    print("name:$_name age:$_age");
  }

  void printP() {
    _info();
    print("height:$height");
  }
}
