import 'package:flutter/material.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class ProfileViewModel extends ChangeNotifier {
  void redactionOnPressed(BuildContext context) {
    Navigator.of(context).pushNamed(Screens.profileRedaction);
  }
}
