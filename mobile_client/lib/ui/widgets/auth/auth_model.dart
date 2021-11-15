import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final usernameTextController = TextEditingController(); //text: 'admin'
  final passwordTextController = TextEditingController(); //text: 'AdMiN_PaSswd'

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    if (username.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();

    String? token;
    try {
      token = await _apiClient.auth(
        username: username,
        password: password,
      );
    } on ApiCLientException catch (e) {
      switch (e.type) {
        case ApiCLientExceptionType.network:
          _errorMessage =
              'Сервер недоступен. Проверьте подключение к интернету.';
          break;
        case ApiCLientExceptionType.auth:
          _errorMessage = 'Неверный логин или пароль.';
          break;
        case ApiCLientExceptionType.other:
          _errorMessage = 'Произошла ошибка, попробуйте еще раз.';
          break;
      }
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (token == null) {
      _errorMessage = 'Неизвестная ошибка. Повторите попытку.';
      notifyListeners();
      return;
    }

    await _tokenDataProvider.setToken(token);
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen);
  }
}
