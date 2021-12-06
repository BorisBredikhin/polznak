import 'package:flutter/material.dart';

abstract class AppColors {
  static const backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color.fromRGBO(0, 22, 217, 0.38),
        Color.fromRGBO(188, 0, 169, 1),
      ],
      begin: Alignment(-0.8, -1),
      end: Alignment(1, 1),
    ),
  );

  static const textFieldFillColor = Color.fromRGBO(244, 244, 244, 1);

  static const purpleForButtonsAndTexts = Color.fromRGBO(151, 62, 201, 1);
}
