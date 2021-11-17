import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AuthModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const _ErrorMessageWidget(),
              InputTextField(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Имя пользователя',
                controller: model?.usernameTextController,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              InputTextField(
                prefixIcon: const Icon(Icons.password),
                hintText: 'Пароль',
                isObscured: true,
                controller: model?.passwordTextController,
              ),
              const SizedBox(height: 6),
              const _AuthButtonWidget(),
              const SizedBox(height: 6),
              const _ResetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Column(
      children: [
        Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
            'Войти',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          );
    return SizedBox(
      height: 28,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(151, 62, 201, 1),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 9),
          ),
        ),
      ),
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Забыли пароль?',
          style: TextStyle(
            color: Color.fromRGBO(151, 62, 201, 1),
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 0),
          ),
          splashFactory: NoSplash.splashFactory,
        ),
      ),
    );
  }
}
