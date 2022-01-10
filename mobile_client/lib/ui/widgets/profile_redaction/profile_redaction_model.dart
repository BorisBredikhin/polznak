import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_client/domain/api_client/api_client.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/domain/entity/conversation.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

//TODO Проверить эту модель, внести изменения в api client

class ProfileRedactionModel extends ChangeNotifier {
  ProfileRedactionModel() {
    getUserInfo();
  }

  final _apiClient = ApiClient();
  final _tokenDataProvider = TokenDataProvider();

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final userameTextController = TextEditingController();
  final dateOfBirthTextController = TextEditingController();
  final genderTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  Participant? _userInfo;
  Participant? get userInfo => _userInfo;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isRegistrationProgress = false;
  bool get canStartRegistration => !_isRegistrationProgress;
  bool get isRegistrationProgress => _isRegistrationProgress;

  String? _token;

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

  void setGender(String? value) {
    if (value == null) {
      genderTextController.text = '';
    } else {
      genderTextController.text = value;
    }
  }

  Future<void> getUserInfo() async {
    final token = await _tokenDataProvider.getToken();
    if (token == null) return;
    try {
      _userInfo = await _apiClient.getUserInfo(token: token);
      if (_userInfo == null) return;
      firstNameTextController.text = _userInfo!.user.firstName;
      lastNameTextController.text = _userInfo!.user.lastName;
      userameTextController.text = _userInfo!.user.username;
      dateOfBirthTextController.text = _userInfo!.birthDate;
      genderTextController.text = _userInfo!.gender == 'M' ? 'Мужчина' : 'Женщина';
      emailTextController.text = _userInfo!.user.email;
      descriptionTextController.text = _userInfo!.details;
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

  // Future<void> saveChanges(BuildContext context) async {
  //   final firstName = firstNameTextController.text;
  //   final lastName = lastNameTextController.text;
  //   final username = userameTextController.text;
  //   final dateOfBirth = dateOfBirthTextController.text;
  //   final gender = genderTextController.text.isEmpty
  //       ? ''
  //       : genderTextController.text == 'Мужчина'
  //           ? 'M'
  //           : 'F';
  //   final email = emailTextController.text;
  //   final description = descriptionTextController.text;

  // if (firstName.isEmpty ||
  //     lastName.isEmpty ||
  //     username.isEmpty ||
  //     dateOfBirth.isEmpty ||
  //     gender.isEmpty ||
  //     email.isEmpty ||
  //     description.isEmpty) {
  //   _errorMessage = 'Заполните все поля';
  //   notifyListeners();
  //   return;
  // }

  // if (!EmailValidator.validate(email)) {
  //   _errorMessage = 'Введите корректный email';
  //   notifyListeners();
  //   return;
  // }

  // _errorMessage = null;
  // _isRegistrationProgress = true;
  // notifyListeners();

  // try {
  //   _token = await _apiClient.register(
  //     firstName: firstName,
  //     lastName: lastName,
  //     username: username,
  //     birthDate: dateOfBirth,
  //     gender: gender,
  //     email: email,
  //     description: description,
  //   );
  // } on ApiCLientException catch (e) {
  //   switch (e.type) {
  //     case ApiCLientExceptionType.network:
  //       _errorMessage =
  //           'Сервер недоступен. Проверьте подключение к интернету.';
  //       break;
  //     case ApiCLientExceptionType.existingAccount:
  //       _errorMessage =
  //           'Аккаунт с таким именем пользователя или email уже существует.';
  //       break;
  //     case ApiCLientExceptionType.incorrectEmail:
  //       _errorMessage = 'Введите корректный email.';
  //       break;
  //     case ApiCLientExceptionType.incorrectData:
  //       _errorMessage = 'Некорректный формат введенных Вами данных.';
  //       break;
  //     default:
  //       _errorMessage = 'Произошла ошибка, попробуйте еще раз.';
  //       break;
  //   }
  // }

//     _isRegistrationProgress = false;
//     if (_errorMessage != null) {
//       notifyListeners();
//       return;
//     }

//     if (_token == null) {
//       _errorMessage = 'Неизвестная ошибка. Повторите попытку.';
//       notifyListeners();
//       return;
//     }

//     await _tokenDataProvider.setToken(_token);
//     Navigator.of(context).pushReplacementNamed(Screens.mainTabs);
//   }
}
