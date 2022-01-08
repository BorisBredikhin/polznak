import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

abstract class TextStyles {
  static const bodyWhite = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 16,
    height: 1.25,
  );

  static const bodyPurple = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.purple,
    fontSize: 16,
    height: 1.25,
  );

  static const bodyBlack = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16,
    height: 1.25,
  );

  static const hintWhite = TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontSize: 12,
    height: 1.333,
  );

  static const hintPurple = TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.purple,
    fontSize: 12,
    height: 1.333,
  );

  static const hintBlack = TextStyle(
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontSize: 12,
    height: 1.333,
  );

  static const whiteButtonText = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 14,
    letterSpacing: 0.5,
    height: 1.25,
  );

  static const blackButtonText = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 14,
    letterSpacing: 0.5,
    height: 1.25,
  );

  static const textFieldHint = TextStyle(
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(136, 136, 136, 1),
    fontSize: 16,
    height: 1.25,
  );

  static const headline5White = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 24,
    height: 1.167,
  );

  static const headline5Purple = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.purple,
    fontSize: 24,
    height: 1.167,
  );

  static const headline6White = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 20,
    height: 1.2,
  );

  static const headline6Purple = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.purple,
    fontSize: 20,
    height: 1.2,
  );

  static const headline7White = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 16,
    height: 1.25,
  );

  static const headline7Purple = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.purple,
    fontSize: 16,
    height: 1.25,
  );

  static const headline6Black = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 20,
    height: 1.2,
  );

  static const headline7Black = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16,
    height: 1.25,
  );

  static const whiteSize10Weight700 = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const whiteSize16 = TextStyle(fontSize: 16, color: Colors.white);

  static const blackSize10Weight400 = TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const purpleSize10Weight700 = TextStyle(
    color: AppColors.purple,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const underlinedWhiteSize10Weight700 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 10,
    decoration: TextDecoration.underline,
  );

  static const errorTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 12,
  );
}
