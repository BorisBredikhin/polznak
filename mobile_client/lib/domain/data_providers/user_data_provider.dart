import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/conversation.dart';

class UserDataProvider {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  Participant? _userInfo;
  Participant? get userInfo => _userInfo;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  UserDataProvider() {
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      _userInfo = await _apiClient.getUserInfo(token: token);
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
  }
}