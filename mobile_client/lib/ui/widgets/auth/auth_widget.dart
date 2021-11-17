import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/auth/auth_form_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.backgroundGradient,
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 15),
                const Text('Название приложения'),
                const SizedBox(height: 60),
                const FormWidget(),
                const SizedBox(height: 5),
                const _RegistrationRow(),
                const SizedBox(height: 45),
                _LoginMethodsDividerWidget(),
                const SizedBox(height: 20),
                const _LoginMethodsWidget()
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
    final model = NotifierProvider.read<AuthModel>(context);
    return SizedBox(
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Новый пользователь?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () => model?.openRegistrationWidget(context),
            child: const Text(
              'Зарегистрироваться',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 9,
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

class _LoginMethodsDividerWidget extends StatelessWidget {
  final _divider = Container(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    color: Colors.white,
    height: 1,
  );

  _LoginMethodsDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _divider),
        const Text(
          'Или войдите с помощью',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 9,
          ),
        ),
        Expanded(child: _divider),
      ],
    );
  }
}

class _LoginMethodsWidget extends StatelessWidget {
  const _LoginMethodsWidget({
    Key? key,
  }) : super(key: key);

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
