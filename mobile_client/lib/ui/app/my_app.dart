import 'package:flutter/material.dart';
import 'package:mobile_client/navigation/main_navigation.dart';
import 'package:mobile_client/ui/app/my_app_model.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({
    Key? key,
    required this.model,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //TODO BottomNavigationBarTheme
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor: Color.fromRGBO(188, 0, 169, 1),
        //   selectedItemColor: Color.fromRGBO(0, 22, 217, 0.5),
        //   unselectedItemColor: Color.fromRGBO(136, 136, 136, 1),
        // ),
      ),

      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      //TODO указать onGenerateRoute
    );
  }
}
