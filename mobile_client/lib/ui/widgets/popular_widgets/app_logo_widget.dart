import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.appLogo);
  }
}
