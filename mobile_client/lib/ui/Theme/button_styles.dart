import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

abstract class ButtonStyles {
  static final purpleOutlinedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.purple,
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    )),
  );

  //костыль для web'a
  static final webRightPurpleOutlinedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.purple,
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(25)),
    )),
  );

  //костыль для web'a
  static final webLeftPurpleOutlinedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.purple,
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25)),
    )),
  );

  //костыль для web'a
  static final webLeftWhiteOutlinedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.white,
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25)),
    )),
  );

  //костыль для web'a
  static final webRightWhiteOutlinedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.white,
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(25)),
    )),
  );

  static final textButton = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(0),
    ),
    minimumSize: MaterialStateProperty.all(const Size(0, 0)),
    splashFactory: NoSplash.splashFactory,
  );
}
