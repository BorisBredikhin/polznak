import 'package:flutter/material.dart';

abstract class AppTheme {
  //TODO Доработать цвета темы
  static final light = ThemeData(
    primarySwatch: Colors.purple,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(188, 0, 169, 1),
      selectedItemColor: Color.fromRGBO(0, 22, 217, 0.5),
      unselectedItemColor: Color.fromRGBO(136, 136, 136, 1),
      showUnselectedLabels: true,
    ),
  );
}
