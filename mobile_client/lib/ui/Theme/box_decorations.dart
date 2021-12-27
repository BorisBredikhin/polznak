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
}