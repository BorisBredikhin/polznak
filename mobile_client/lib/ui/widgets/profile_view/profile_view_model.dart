import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/conversation.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class ProfileViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  Participant? _userInfo;
  Participant? get userInfo => _userInfo;

  ProfileViewModel() {
    getUserInfo();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void logout(BuildContext context) {
      TokenDataProvider().setToken(null);
      Navigator.of(context).pushReplacementNamed(Screens.auth);
    }

  Future<void> getUserInfo() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      _userInfo = await _apiClient.getUserInfo(token: token);
      if (_userInfo == null) return;
      notifyListeners();
    } on ApiCLientException catch (e) {
      switch (e.type) {
        case ApiCLientExceptionType.network:
          _errorMessage =
              'Сервер недоступен. Проверьте подключение к интернету.';
          break;
        default:
          _errorMessage = 'Произошла ошибка, попробуйте еще раз.';
          break;
      }
    }

    if (_errorMessage != null) {
      notifyListeners();
    }
  }

  void redactionOnPressed(BuildContext context) {
    Navigator.of(context).pushNamed(Screens.profileRedaction);
  }
}
