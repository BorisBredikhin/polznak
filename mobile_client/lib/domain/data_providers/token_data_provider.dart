import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const token = 'token';
}

class TokenDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getToken() => _secureStorage.read(key: _Keys.token);
  Future<void> setToken(String? value) {
    if (value != null) {
      return _secureStorage.write(
        key: _Keys.token,
        value: value,
      );
    } else {
      return _secureStorage.delete(key: _Keys.token);
    }
  }
}