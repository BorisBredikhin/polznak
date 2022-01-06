import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';

class EssayCreationModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isSaveProgress = false;
  bool get canStartSave => !_isSaveProgress;
  bool get isSaveProgress => _isSaveProgress;

  Future<void> savePost(BuildContext context) async {
    final title = titleTextController.text;
    final content = contentTextController.text;

    if (title.isEmpty || content.isEmpty) {
      _errorMessage = 'Заполните заголовок и текст эссе';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isSaveProgress = true;
    notifyListeners();

    final _token = await _tokenDataProvider.getToken();
    try {
      await _apiClient.savePost(
        title: title,
        content: content,
        token: _token!,
      );
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

    _isSaveProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }
    titleTextController.clear();
    contentTextController.clear();
    notifyListeners();
  }
}
