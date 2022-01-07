import 'package:shared_preferences/shared_preferences.dart';

abstract class _Keys {
  static const token = 'token';
}

class TokenDataProvider {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_Keys.token);
  }
  Future<void> setToken(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value != null) {
      prefs.setString(_Keys.token, value);
    } else {
      prefs.remove(_Keys.token);
    }
  }
}