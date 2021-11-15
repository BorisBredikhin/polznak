import 'dart:convert';

import 'package:http/http.dart' as http;

enum ApiCLientExceptionType { Network, Auth, Other }

class ApiCLientException implements Exception {
  final ApiCLientExceptionType type;

  ApiCLientException(this.type);
}

class ApiClient {
  static const _host = 'http://127.0.0.1:8000';

  Future<void> auth({
    required String username,
    required String password,
  }) async {
    final token = _makeToken(
      username: username,
      password: password,
    );
    print(token);
  }

  Future<String> _makeToken({
    required String username,
    required String password,
  }) async {
    final body = <String, dynamic>{
      'username': username,
      'password': password,
    };

    final response = await http.post(
        Uri.parse(_host+'/api-token-auth/'),
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode(body)
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return jsonDecode(response.body)['token'] as String;
  }
}
