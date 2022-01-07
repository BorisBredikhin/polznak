import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/auth/auth_form_widget.dart';
import 'package:provider/provider.dart';

class AuthWebWidget extends StatelessWidget {
  const AuthWebWidget({Key? key}) : super(key: key);

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
                  AuthFormWidget(),
                  SizedBox(height: 16),
                  _RegistrationRow(),
                  SizedBox(height: 16),
                  _LoginMethodsDividerWidget(),
                  SizedBox(height: 16),
                  _LoginMethodsWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegistrationRow extends StatelessWidget {
  const _RegistrationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () => model.openRegistrationWidget(context),
        child: const Text(
          'Зарегистрироваться',
          style: TextStyles.bodyWhite,
        ),
        style: ButtonStyles.textButton,
      ),
    );
  }
}

class _LoginMethodsDividerWidget extends StatelessWidget {
  const _LoginMethodsDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Container(
      color: Colors.white,
      height: 1,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: divider),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Или войдите с помощью',
            style: TextStyles.bodyWhite,
          ),
        ),
        Expanded(child: divider),
      ],
    );
  }
}

class _LoginMethodsWidget extends StatelessWidget {
  const _LoginMethodsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LoginMethodsButtonWidget(
          image: Image.asset(AppImages.googleIcon),
        ),
        const SizedBox(width: 24),
        _LoginMethodsButtonWidget(
          image: Image.asset(AppImages.mailIcon),
        ),
      ],
    );
  }
}

class _LoginMethodsButtonWidget extends StatelessWidget {
  final Image image;
  const _LoginMethodsButtonWidget({
    Key? key,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: image,
      iconSize: 48,
      padding: const EdgeInsets.all(0),
    );
  }
}
