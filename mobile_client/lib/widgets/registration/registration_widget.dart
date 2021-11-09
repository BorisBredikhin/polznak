import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/widgets/registration/registration_form_widget.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(0, 22, 217, 0.38),
              Color.fromRGBO(188, 0, 169, 1),
            ],
            begin: Alignment(-0.8, -1),
            end: Alignment(1, 1),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 130,
                    width: 130,
                    child: Placeholder(),
                  ),
                  const SizedBox(height: 15),
                  const Text('Название приложения'),
                  const SizedBox(height: 60),
                  const RegistrationFormWidget(),
                  const SizedBox(height: 5),
                  const _EnterRow(),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnterRow extends StatelessWidget {
  const _EnterRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Уже зарегистрированы?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Войти',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                decoration: TextDecoration.underline,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 3),
              ),
              splashFactory: NoSplash.splashFactory,
            ),
          )
        ],
      ),
    );
  }
}
