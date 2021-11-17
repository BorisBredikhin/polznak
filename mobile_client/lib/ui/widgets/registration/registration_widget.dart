import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_form_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';

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
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                AppLogoWidget(),
                SizedBox(height: 15),
                Text('Название приложения'),
                SizedBox(height: 60),
                RegistrationFormWidget(),
                SizedBox(height: 5),
                _EnterRow(),
                SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EnterRow extends StatelessWidget {
  const _EnterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<RegistrationModel>(context);
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
            onPressed: () => model?.openAuthWidget(context),
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
