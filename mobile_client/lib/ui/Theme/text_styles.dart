import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

abstract class TextStyles {
  static const whiteSize10Weight700 = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const blackSize10Weight400 = TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const purpleSize10Weight700 = TextStyle(
    color: AppColors.purpleForButtonsAndTexts,
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

  static const textFieldHintStyle = TextStyle(
    fontSize: 10,
    color: Color.fromRGBO(136, 136, 136, 1),
    fontWeight: FontWeight.w400,
  );
}
