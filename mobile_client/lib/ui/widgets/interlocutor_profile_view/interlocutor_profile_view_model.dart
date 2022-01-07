import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/conversation.dart';

class InterlocutorProfileViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final int _userId;
  
  Participant? _userInfo;
  Participant? get userInfo => _userInfo;

  InterlocutorProfileViewModel(this._userId) {
    getUserInfo(_userId);
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getUserInfo(int userId) async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      _userInfo = await _apiClient.getUserInfo(token: token, userId: userId);
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
}
