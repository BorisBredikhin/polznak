import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

enum ApiCLientExceptionType {
  network,
  auth,
  existingAccount,
  incorrectData,
  incorrectEmail,
  other
}

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

  Future<String> register({
    required String firstName,
    required String lastName,
    required String username,
    required String birthDate,
    required String gender,
    required String email,
    required String password,
  }) async {
    final body = <String, dynamic>{
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "birth_date": birthDate,
      "gender": gender,
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(
        Uri.parse(_host + '/api/register/'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        throw ApiCLientException(ApiCLientExceptionType.existingAccount);
        // throw Exception(response.body);
      } else if (response.statusCode == 400) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        json.keys.contains('email')
            ? throw ApiCLientException(ApiCLientExceptionType.incorrectEmail)
            : throw ApiCLientException(ApiCLientExceptionType.incorrectData);
      }
      final token = jsonDecode(response.body) as String;
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
