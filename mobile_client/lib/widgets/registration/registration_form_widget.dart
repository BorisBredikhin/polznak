import 'package:flutter/material.dart';

class RegistrationFormWidget extends StatefulWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  _RegistrationFormWidgetState createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  final _nameTextController = TextEditingController();
  final _dateOfBirthTextController = TextEditingController();
  final _genderTextController = TextEditingController();
  final _mailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _repeatPasswordTextController = TextEditingController();

  void _reg() {
    final name = _nameTextController.text;
    final dateOfBirth = _dateOfBirthTextController.text;
    final gender = _genderTextController.text;
    final password = _passwordTextController.text;
    final mail = _mailTextController.text;
    final repeatPassword = _repeatPasswordTextController.text;

    print(name + dateOfBirth + gender + password + mail + repeatPassword);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _InputTextField(
                hintText: 'Name',
                isObscured: false,
                controller: _nameTextController,
              ),
              const SizedBox(height: 6),
              _InputTextField(
                hintText: 'Date of birth',
                isObscured: false,
                suffixIcon: Icon(Icons.calendar_today),
                controller: _dateOfBirthTextController,
              ),
              const SizedBox(height: 6),
              _InputTextField(
                hintText: 'Gender',
                isObscured: false,
                controller: _genderTextController,
              ),
              const SizedBox(height: 6),
              _InputTextField(
                hintText: 'Email',
                isObscured: false,
                controller: _mailTextController,
              ),
              const SizedBox(height: 6),
              _InputTextField(
                hintText: 'Password',
                isObscured: true,
                controller: _passwordTextController,
              ),
              const SizedBox(height: 6),
              _InputTextField(
                hintText: 'Repeat password',
                isObscured: true,
                controller: _repeatPasswordTextController,
              ),
              const SizedBox(height: 6),
              _registrationButton(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _registrationButton() {
    return SizedBox(
      height: 28,
      child: OutlinedButton(
        onPressed: _reg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Зарегистрироваться',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(151, 62, 201, 1),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 6),
          ),
        ),
      ),
    );
  }
}

class _InputTextField extends StatelessWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String hintText;
  final bool isObscured;
  final TextEditingController controller;
  const _InputTextField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.isObscured,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 10,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: suffixIcon,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 35,
        ),
        contentPadding: const EdgeInsets.all(6),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 9,
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: prefixIcon,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 35,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(244, 244, 244, 1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      obscureText: isObscured,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
    );
  }
}
