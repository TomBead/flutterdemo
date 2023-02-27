import 'package:flutter/material.dart';

import 'FMRouteManager.dart';


//入口,为main.dart 独有
// void main() {
//   // runApp(FMMaterialAppVC());
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FMRouteManager manager = FMRouteManager();
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (setting) {
        return manager.routeWithSetting(setting);
      },
      onUnknownRoute: (setting) {
        return manager.unknowRouteWithSetting(setting);
      },
    );
  }
}
