import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:provider/provider.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecorations.formBackground,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: const [
            _ErrorMessageWidget(),
            _UsernameFieldWidget(),
            SizedBox(height: 16),
            _PasswordFieldWidget(),
            SizedBox(height: 16),
            _AuthButtonWidget(),
            SizedBox(height: 16),
            _ResetPasswordButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((AuthModel vm) => vm.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();
    return Column(
      children: [
        Text(
          errorMessage,
          style: TextStyles.errorTextStyle,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _UsernameFieldWidget extends StatelessWidget {
  const _UsernameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return InputTextField(
      hintText: 'Имя пользователя',
      controller: model.usernameTextController,
      textInputAction: TextInputAction.next,
    );
  }
}

class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthModel>();
    return InputTextField(
      hintText: 'Пароль',
      isObscured: true,
      controller: model.passwordTextController,
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthModel>();
    final onPressed =
        model.canStartAuth == true ? () => model.auth(context) : null;
    final child = model.isAuthProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
            'ВОЙТИ',
            style: TextStyles.whiteButtonText,
          );
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyles.purpleOutlinedButton,
      ),
    );
  }
}

class _ResetPasswordButtonWidget extends StatelessWidget {
  const _ResetPasswordButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Забыли пароль?',
          style: TextStyles.bodyPurple,
        ),
        style: ButtonStyles.textButton,
      ),
    );
  }
}
