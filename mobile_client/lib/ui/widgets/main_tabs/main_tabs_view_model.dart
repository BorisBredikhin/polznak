import 'package:flutter/material.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class MainTabsViewModel extends ChangeNotifier {
  var _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;
  
  void setCurrentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }

  void logout(BuildContext context) {
      TokenDataProvider().setToken(null);
      Navigator.of(context).pushReplacementNamed(Screens.auth);
    }
}