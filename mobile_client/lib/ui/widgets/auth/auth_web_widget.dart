import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:provider/provider.dart';
import 'auth_web_form_widget.dart';

class AuthWebWidget extends StatelessWidget {
  const AuthWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecorations.darkScaffoldGradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                height: 696,
                child: DecoratedBox(
                  decoration: BoxDecorations.webFormBackground,
                  child: ListView(
                    children: [
                      const _AuthRegistrationRow(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 16),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            AppLogoWidget(),
                            SizedBox(height: 16),
                            AuthWebFormWidget(),
                            SizedBox(height: 16),
                            _WebLoginMethodsDividerWidget(),
                            SizedBox(height: 16),
                            _LoginMethodsWidget()
                          ],
                        ),
                      ),
                    ],
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

class _WebLoginMethodsDividerWidget extends StatelessWidget {
  const _WebLoginMethodsDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Container(
      color: Colors.purple,
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
            style: TextStyles.bodyPurple,
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
          image: Image.asset(AppImages.webGoogleIcon),
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

class _AuthRegistrationRow extends StatelessWidget {
  const _AuthRegistrationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Container(
      color: Colors.purple,
      height: 1,
    );

    return Container(
      child: Column(
        children: [
          Row(
            children: const [_WebAuthRow(), _WebRegistrationRow()],
          ),
          divider,
        ],
      ),
    );
  }
}

class _WebRegistrationRow extends StatelessWidget {
  const _WebRegistrationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return SizedBox(
      height: 48,
      width: 180,
      child: TextButton(
        onPressed: () => model.openRegistrationWidget(context),
        child: const Text(
          'РЕГИСТРАЦИЯ',
          style: TextStyles.bodyWhite,
        ),
        style: ButtonStyles.webRightPurpleOutlinedButton,
      ),
    );
  }
}

class _WebAuthRow extends StatelessWidget {
  const _WebAuthRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return SizedBox(
      height: 48,
      width: 180,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'ВХОД',
          style: TextStyles.bodyPurple,
        ),
        style: ButtonStyles.webLeftWhiteOutlinedButton,
      ),
    );
  }
}
