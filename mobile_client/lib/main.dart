import 'package:flutter/material.dart';
import 'package:mobile_client/ui/app/my_app.dart';
import 'package:mobile_client/ui/app/my_app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  runApp(MyApp(model: model));
}
