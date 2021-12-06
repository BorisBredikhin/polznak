import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  String? _token;

  void openRegistrationWidget(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed(Screens.registration);
  }

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

    try {
      _token = await _apiClient.auth(
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
        default:
          _errorMessage = 'Произошла ошибка, попробуйте еще раз.';
          break;
      }
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (_token == null) {
      _errorMessage = 'Неизвестная ошибка. Повторите попытку.';
      notifyListeners();
      return;
    }

    await _tokenDataProvider.setToken(_token);
    Navigator.of(context)
        .pushReplacementNamed(Screens.mainTabs);
  }
}
