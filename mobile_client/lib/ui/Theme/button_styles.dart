import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

abstract class ButtonStyles {
  static final purpleOutlinedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      AppColors.purpleForButtonsAndTexts,
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    )),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 9),
    ),
  );

  static final textButton = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(0),
    ),
    minimumSize: MaterialStateProperty.all(const Size(0, 0)),
    splashFactory: NoSplash.splashFactory,
  );
}
