import 'dart:convert';
import 'dart:io';

enum ApiCLientExceptionType { Network, Auth, Other }

class ApiCLientException implements Exception {
  final ApiCLientExceptionType type;

  ApiCLientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'http://192.168.56.1:8000';

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

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> _get<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiCLientException(ApiCLientExceptionType.Network);
    } on ApiCLientException {
      rethrow;
    } catch (_) {
      throw ApiCLientException(ApiCLientExceptionType.Other);
    }
  }

  Future<T> _post<T>(
    String path,
    Map<String, dynamic>? bodyParameters,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await _client.postUrl(url);

      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    // } on SocketException {
    //   throw ApiCLientException(ApiCLientExceptionType.Network);
    // } on ApiCLientException {
    //   rethrow;
    // } catch (_) {
    //   throw ApiCLientException(ApiCLientExceptionType.Other);
    // }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 400) {
      throw ApiCLientException(ApiCLientExceptionType.Auth);
    }
  }

  Future<String> _makeToken({
    required String username,
    required String password,
  }) async {
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
    };
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['token'] as String;
      return token;
    };
    final result = _post(
      '/api-token-auth/',
      parameters,
      parser,
    );
    return result;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
