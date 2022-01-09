import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/conversation.dart';
import 'package:mobile_client/domain/entity/message.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class PersonalMessagesModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final messageTextController = TextEditingController();

  final scrollController = ScrollController();

  final int _conversationId;
  int get conversationId => _conversationId;

  Timer? timer;

  PersonalMessagesModel(this._conversationId) {
    getUserInfo();
    getInerlocutorInfo();
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => getMessagesFromServer());
    // getMessagesFromServer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  final _messagesList = <Message>[];
  List<Message> get messagesList => _messagesList;

  Participant? _userInfo;
  Participant? get userInfo => _userInfo;

  Participant? _interlocutorInfo;
  Participant? get interlocutorInfo => _interlocutorInfo;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

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

    if (_errorMessage != null) {
      notifyListeners();
    }
  }

  Future<void> getInerlocutorInfo() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      final participants = await _apiClient.getConversationParticipants(
          token: token, chatId: conversationId);
      for (Participant participant in participants) {
        if (participant.id != _userInfo?.id) {
          _interlocutorInfo = participant;
          notifyListeners();
        }
      }
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

  Future<List<Message>?> getMessagesFromServer() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) {
      return null;
    } //TODO Выкинуть на страницу авторизации
    try {
      final messages = await _apiClient.getMessages(
          token: token, conversationId: conversationId);
      _messagesList.clear();
      _messagesList.addAll(messages);
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

  Future<void> sendMessage() async {
    final messageText = messageTextController.text;

    if (messageText.isEmpty) {
      return;
    }

    _errorMessage = null;
    notifyListeners();

    final token = await _tokenDataProvider.getToken();
    if (token == null) {
      return null;
    } //TODO Выкинуть на страницу авторизации

    try {
      await _apiClient.sendMessage(
        token: token,
        conversationId: conversationId,
        messageText: messageText,
      );
      // scrollController.animateTo(scrollController.position.maxScrollExtent,
      //     duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      messageTextController.clear();
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
      return;
    }
    //TODO Переделать чтобы работал скролл вниз после отправки сообщения, обновляется весь список сообщений и соответственно виджет мигает когда происходит ребилд
    getMessagesFromServer();
    notifyListeners();
  }

  void onProfileTap(BuildContext context) {
    final userId = _interlocutorInfo?.user.id;
    Navigator.of(context).pushNamed(
      Screens.interlocutorProfile,
      arguments: userId,
    );
  }
}
