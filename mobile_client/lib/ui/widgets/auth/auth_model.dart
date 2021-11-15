import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final mailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth (BuildContext context) async {
    // TODO: Обработка входа
    // final username = mailTextController.text;
    // final password = passwordTextController.text;
    const username = 'admin';
    const password = 'admIn?1';
    if (username.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _apiClient.auth(username: username, password: password);
    print(username + password);
  }
}
