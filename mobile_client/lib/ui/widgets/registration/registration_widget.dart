import 'package:flutter/material.dart';
import 'package:mobile_client/navigation/main_navigation.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/widgets/registration/registration_form_widget.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.backgroundGradient,
        child: ListView(
          children: [
            const SizedBox(height: 80),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: Placeholder(),
                  ),
                  SizedBox(height: 15),
                  Text('Название приложения'),
                  SizedBox(height: 60),
                  RegistrationFormWidget(),
                  SizedBox(height: 5),
                  _EnterRow(),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnterRow extends StatefulWidget {
  const _EnterRow({
    Key? key,
  }) : super(key: key);

  @override
  State<_EnterRow> createState() => _EnterRowState();
}

class _EnterRowState extends State<_EnterRow> {
  void _openAuthWidget() {
    Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.auth);
  }

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
            onPressed: _openAuthWidget,
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
