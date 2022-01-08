import 'package:flutter/material.dart';

abstract class BoxDecorations {
  static const scaffoldGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color.fromRGBO(0, 22, 217, 0.38),
        Color.fromRGBO(188, 0, 169, 1),
      ],
      begin: Alignment(-0.8, -1),
      end: Alignment(1, 1),
    ),
  );

  static const darkScaffoldGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color.fromRGBO(155, 162, 229, 1),
        Color.fromRGBO(83, 4, 78, 1),
      ],
      begin: Alignment(-0.8, -1),
      end: Alignment(1, 1),
    ),
  );

  static const whiteScaffold = BoxDecoration(
    color: Colors.white,
  );

  static const bottomNavBarGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color.fromRGBO(142, 78, 205, 1),
        Color.fromRGBO(180, 1, 162, 1),
      ],
      begin: Alignment(-1, 0),
      end: Alignment(1, 0),
    ),
  );

  static const feedFloatingButtonsGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.white,
        Color.fromRGBO(255, 255, 255, 0),
      ],
      begin: Alignment(0, 0),
      end: Alignment(0, -1),
    ),
  );

  static final formBackground = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  );

//костыль для web'a
  static final webFormBackground = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
  );
}
