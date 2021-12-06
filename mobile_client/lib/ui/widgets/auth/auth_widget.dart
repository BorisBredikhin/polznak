import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/auth/auth_form_widget.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

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
                AuthFormWidget(),
                SizedBox(height: 5),
                _RegistrationRow(),
                SizedBox(height: 45),
                _LoginMethodsDividerWidget(),
                SizedBox(height: 20),
                _LoginMethodsWidget()
              ],
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
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Новый пользователь?',
            style: TextStyles.whiteSize10Weight700,
          ),
          const SizedBox(width: 3),
          TextButton(
            onPressed: () => model.openRegistrationWidget(context),
            child: const Text(
              'Зарегистрироваться',
              style: TextStyles.underlinedWhiteSize10Weight700,
            ),
            style: ButtonStyles.textButton,
          )
        ],
      ),
    );
  }
}

class _LoginMethodsDividerWidget extends StatelessWidget {
  const _LoginMethodsDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      height: 1,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: divider),
        const Text(
          'Или войдите с помощью',
          style: TextStyles.whiteSize10Weight700,
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
        const SizedBox(width: 40),
        _LoginMethodsButtonWidget(
          image: Image.asset(AppImages.mailRuLogo),
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
      iconSize: 60,
      padding: const EdgeInsets.all(0),
    );
  }
}
