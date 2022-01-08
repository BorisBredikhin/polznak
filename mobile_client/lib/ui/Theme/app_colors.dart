import 'package:flutter/material.dart';

abstract class AppColors {
  static const textFieldActive = Color.fromRGBO(192, 192, 192, 1);

  static const purple = Color.fromRGBO(151, 62, 201, 1);
  static const white = Color.fromARGB(255, 255, 255, 255); //костыль для web'a

  static const bottomNavigationBarGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color.fromRGBO(142, 78, 205, 1),
        Color.fromRGBO(180, 1, 162, 1),
      ],
      begin: Alignment(-1, 0.5),
      end: Alignment(1, 0.5),
    ),
  );

  static const profileInfoGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(22, 1, 255, 0.3),
      Color.fromRGBO(255, 0, 214, 0.05),
    ],
    begin: Alignment(-0.8, -1),
    end: Alignment(1, 1),
  );

  static const essayThemeGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(140, 111, 221, 0.7),
      Color.fromRGBO(148, 56, 194, 0.7),
    ],
    begin: Alignment(-0.8, -1),
    end: Alignment(1, 1),
  );

  static const usernameGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(135, 105, 233, 1),
      Color.fromRGBO(147, 72, 205, 1),
    ],
    begin: Alignment(-0.8, -1),
    end: Alignment(1, 1),
  );

  static const textFieldFillColor = Color.fromRGBO(244, 244, 244, 1);
}
