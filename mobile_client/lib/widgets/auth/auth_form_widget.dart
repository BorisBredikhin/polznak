import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _mailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _auth() {
    final mail = _mailTextController.text;
    final password = _passwordTextController.text;
    print(mail + password);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
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
                prefixIcon: const Icon(Icons.mail),
                hintText: 'Email',
                isObscured: false,
                controller: _mailTextController,
              ),
              const SizedBox(height: 6),
              _InputTextField(
                prefixIcon: const Icon(Icons.password),
                hintText: 'Password',
                isObscured: true,
                controller: _passwordTextController,
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 28,
                child: OutlinedButton(
                  onPressed: _auth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Войти',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
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
                      const EdgeInsets.symmetric(vertical: 9),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 10,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: Color.fromRGBO(151, 62, 201, 1),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 0),
                    ),
                    splashFactory: NoSplash.splashFactory,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final bool isObscured;
  final TextEditingController controller;
  const _InputTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.isObscured,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 9,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
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
          minHeight: 0,
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
