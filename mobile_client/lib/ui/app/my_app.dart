import 'package:flutter/material.dart';
import 'package:mobile_client/navigation/main_navigation.dart';
import 'package:mobile_client/ui/widgets/auth/auth_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_widget.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.routes,
      //TODO Передать корректный isAuth
      initialRoute: mainNavigation.initialRoute(true),
    );
  }
}