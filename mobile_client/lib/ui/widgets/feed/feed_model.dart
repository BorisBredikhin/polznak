import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/post.dart';

class FeedModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  List<Post> _posts = [];
  int _index = 0;

  bool isLoadingProgress = false;

  String? _errorMessage;

  Future<void> getPosts() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return; //TODO Выкинуть на страницу авторизации
    _posts.clear();
    try {
      final posts = await _apiClient.getPosts(token: token);
      _posts.addAll(posts);
      var postsAmount = _posts.length;
      _index = postsAmount - 1;
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

  FeedModel() {
    getPosts();
  }

  String? get errorMessage => _errorMessage;

  Post? getCurrentPost() {
    if (_posts.isEmpty) {
      return null;
    }
    return _posts[_index];
  }

  Future<void> sendLikeOrDislike(bool isLike, int postId) async {
    final _token = await _tokenDataProvider.getToken();
    final int grade;
    if (isLike) {
      grade = 1;
    } else {
      grade = -1;
    }
    try {
      await _apiClient.postLikeOrDislike(
          grade: grade, postId: postId, token: _token!);
      if (_index > 0) {
        _index -= 1;
      } else {
        getPosts();
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
}
