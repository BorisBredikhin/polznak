import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

enum ApiCLientExceptionType { network, auth, other }

class ApiCLientException implements Exception {
  final ApiCLientExceptionType type;

  ApiCLientException(this.type);
}

class ApiClient {
  static const _host = 'http://192.168.56.1:8000';

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken(
      username: username,
      password: password,
    );
    return token;
  }

  Future<String> _makeToken({
    required String username,
    required String password,
  }) async {
    final body = <String, dynamic>{
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(_host + '/api-token-auth/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode != 200) {
        throw ApiCLientException(ApiCLientExceptionType.auth);
        // throw Exception(response.body);
      }
      final token = jsonDecode(response.body)['token'] as String;
      return token;
    } on SocketException {
      throw ApiCLientException(ApiCLientExceptionType.network);
    } on ApiCLientException {
      rethrow;
    } catch (e) {
      throw ApiCLientException(ApiCLientExceptionType.other);
    }
  }
}
