import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

abstract class TextStyles {
  static const bodyWhiteTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 16,
    height: 1.25,
  );

  static const bodyPurpleTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.purple,
    fontSize: 16,
    height: 1.25,
  );

  static const bodyBlackTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16,
    height: 1.25,
  );

  static const buttonTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 14,
    letterSpacing: 0.5,
    height: 1.25,
  );

  static const textFieldHintStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(136, 136, 136, 1),
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
