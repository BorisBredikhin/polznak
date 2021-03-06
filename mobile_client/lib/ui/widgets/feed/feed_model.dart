import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/post.dart';

class FeedModel extends ChangeNotifier {
  FeedModel() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (_posts.isEmpty) getPosts();
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  Timer? timer;

  final _posts = <Post>[];
  int _index = 0;

  bool _isLoadingProgress = true;
  bool get isLoadingProgress => _isLoadingProgress;

  String? _errorMessage;

  Future<void> getPosts() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      _posts.clear();
      final posts = await _apiClient.getPosts(token: token);
      _posts.addAll(posts);
      var postsAmount = _posts.length;
      _index = postsAmount - 1;
      _isLoadingProgress = false;
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
    } catch (e) {
      return;
    }

    if (_errorMessage != null) {
      notifyListeners();
    }
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
        _isLoadingProgress = true;
        notifyListeners();
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
