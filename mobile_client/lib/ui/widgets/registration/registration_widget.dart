import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_form_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:provider/provider.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.scaffoldGradient,
        child: ListView(
          children: [
            Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(height: 80),
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
    final model = context.read<RegistrationModel>();
    return SizedBox(
      height: 15,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Уже зарегистрированы?',
            style: TextStyles.whiteSize10Weight700,
          ),
          TextButton(
            onPressed: () => model.openAuthWidget(context),
            child: const Text(
              'Войти',
              style: TextStyles.underlinedWhiteSize10Weight700,
            ),
            style: ButtonStyles.textButton,
          )
        ],
      ),
    );
  }
}
