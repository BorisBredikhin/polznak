import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/conversation.dart';
import 'package:mobile_client/domain/entity/message.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

//TODO По возможности отрефакторить
class ChatsModel extends ChangeNotifier {

  ChatsModel() {
    // Timer.periodic(const Duration(seconds: 1), (Timer t) => getConversations());
    getConversations();
    getUserInfo();
  }

  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final _conversations = <Conversation>[];
  List<Conversation> get conversations => _conversations;

  final _messages = <Message>[];
  List<Message> messages() {
    return _messages;
  }

  final Map<int, Message?> _lastMessagesInEachConversation = {};

  Map<int, Message?> get lastMessagesInEachConversation => _lastMessagesInEachConversation;

  Participant? _userInfo;
  Participant? get userInfo => _userInfo;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getConversations() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    _conversations.clear();
    try {
      final conversations = await _apiClient.getConversations(token: token);
      _conversations.addAll(conversations);
      for (var i = 0; i < conversations.length; i++) {
        final messagesList = await getMessagesFromServer(i);
        if (messagesList == null || messagesList.isEmpty) {
          continue;
        }
        final lastMessage = messagesList[0];
        _lastMessagesInEachConversation[conversations[i].id] = lastMessage;
      }
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

  Future<void> getUserInfo() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      _userInfo = await _apiClient.getUserInfo(token: token);
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

  Participant? getInterlocutorInfo(int index) {
    final participants = _conversations[index].participants;
    for (Participant participant in participants) {
      if (participant.id != userInfo?.id) {
        return participant;
      }
    }
  }

  Future<List<Message>?> getMessagesFromServer(int index) async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) {
      return <Message>[];
    }
    final conversationId = _conversations[index].id;
    _messages.clear();
    try {
      final messages = await _apiClient.getMessages(
          token: token, conversationId: conversationId);
      return messages;
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

  void onConversationTap(BuildContext context, int index) {
    final id = _conversations[index].id;
    Navigator.of(context).pushNamed(
      Screens.personalMessages,
      arguments: id,
    );
  }
}
