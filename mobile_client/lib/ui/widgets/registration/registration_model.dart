import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class RegistrationModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final userameTextController = TextEditingController();
  final dateOfBirthTextController = TextEditingController();
  final genderTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  DateTime selectedDate = DateTime(DateTime.now().year);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Выберите дату рождения',
      errorFormatText: 'Введите дату в указанном формате',
      errorInvalidText: 'От 01/01/1900 до текущего времени',
      fieldLabelText: 'Дата рождения',
      fieldHintText: 'мм/дд/гггг',
    );
    if (picked != null) {
      dateOfBirthTextController.text = picked.toString().split(' ')[0];
    }
  }

  void setGender(String value) {
    genderTextController.text = value;
  }

  void openAuthWidget(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.auth);
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isRegistrationProgress = false;
  bool get canStartRegistration => !_isRegistrationProgress;
  bool get isRegistrationProgress => _isRegistrationProgress;

  Future<void> register(BuildContext context) async {
    final firstName = firstNameTextController.text;
    final lastName = lastNameTextController.text;
    final username = userameTextController.text;
    final dateOfBirth = dateOfBirthTextController.text;
    final gender = genderTextController.text.isEmpty
        ? ''
        : genderTextController.text == 'Мужчина'
            ? 'M'
            : 'Ж';
    final email = emailTextController.text;
    final password = passwordTextController.text;
    final repeatPassword = repeatPasswordTextController.text;
    
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        username.isEmpty ||
        dateOfBirth.isEmpty ||
        gender.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        repeatPassword.isEmpty) {
      _errorMessage = 'Заполните все поля';
      notifyListeners();
      return;
    }

    if (!EmailValidator.validate(email)) {
      _errorMessage = 'Введите корректный email';
      notifyListeners();
      return;
    }

    if (password != repeatPassword) {
      _errorMessage = 'Пароли не совпадают';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isRegistrationProgress = true;
    notifyListeners();

    String? token;
    try {
      token = await _apiClient.register(
        firstName: firstName,
        lastName: lastName,
        username: username,
        birthDate: dateOfBirth,
        gender: gender,
        email: email,
        password: password,
      );
    } on ApiCLientException catch (e) {
      switch (e.type) {
        case ApiCLientExceptionType.network:
          _errorMessage =
              'Сервер недоступен. Проверьте подключение к интернету.';
          break;
        case ApiCLientExceptionType.existingAccount:
          _errorMessage =
              'Аккаунт с таким именем пользователя или email уже существует.';
          break;
        case ApiCLientExceptionType.incorrectEmail:
          _errorMessage = 'Введите корректный email.';
          break;
        case ApiCLientExceptionType.incorrectData:
          _errorMessage = 'Некорректный формат введенных Вами данных.';
          break;
        default:
          _errorMessage = 'Произошла ошибка, попробуйте еще раз.';
          break;
      }
    }

    _isRegistrationProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (token == null) {
      _errorMessage = 'Неизвестная ошибка. Повторите попытку.';
      notifyListeners();
      return;
    }

    await _tokenDataProvider.setToken(token);
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRouteNames.mainScreen);
  }
}
