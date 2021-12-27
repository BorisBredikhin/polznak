import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
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
        decoration: BoxDecorations.scaffoldGradient,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  AppLogoWidget(),
                  SizedBox(height: 16),
                  RegistrationFormWidget(),
                  SizedBox(height: 16),
                  _EnterRow(),
                  SizedBox(height: 16),
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
  const _EnterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () => model.openAuthWidget(context),
        child: const Text(
          'Войти',
          style: TextStyles.bodyWhite,
        ),
        style: ButtonStyles.textButton,
      ),
    );
  }
}
