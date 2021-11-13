import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/auth/auth_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/registration': (context) => const RegistrationWidget(),
      },
      initialRoute: '/auth',
    );
  }
}