import 'package:mobile_client/domain/data_providers/token_data_provider.dart';

class MyAppModel {
  final _tokenDataProvider = TokenDataProvider();
  
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final token = await _tokenDataProvider.getToken();
    _isAuth = token != null;
  }
}