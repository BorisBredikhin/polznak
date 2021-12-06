import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:provider/provider.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              _ErrorMessageWidget(),
              _FirstNameFieldWidget(),
              SizedBox(height: 6),
              _LastNameFieldWidget(),
              SizedBox(height: 6),
              _UsernameFieldWidget(),
              SizedBox(height: 6),
              _DateOfBirthFieldWidget(),
              SizedBox(height: 6),
              _GenderChoiceWidget(),
              SizedBox(height: 6),
              _EmailTextFieldWidget(),
              SizedBox(height: 6),
              _PasswordFieldWidget(),
              SizedBox(height: 6),
              _RepeatPasswordFieldWidget(),
              SizedBox(height: 6),
              _RegistrationButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FirstNameFieldWidget extends StatelessWidget {
  const _FirstNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Имя',
      controller: model.firstNameTextController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}

class _LastNameFieldWidget extends StatelessWidget {
  const _LastNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Фамилия',
      controller: model.lastNameTextController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}

class _UsernameFieldWidget extends StatelessWidget {
  const _UsernameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Имя пользователя',
      controller: model.userameTextController,
      textInputAction: TextInputAction.next,
    );
  }
}

class _DateOfBirthFieldWidget extends StatelessWidget {
  const _DateOfBirthFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Дата рождения',
      suffixIcon: const Icon(Icons.calendar_today),
      controller: model.dateOfBirthTextController,
      keyboardType: TextInputType.none,
      onTap: () => model.selectDate(context),
    );
  }
}

class _GenderChoiceWidget extends StatelessWidget {
  const _GenderChoiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    final dropdownItems = ["Мужчина", "Женщина"]
        .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
        .toList();
    return DropdownButtonFormField<String>(
      iconSize: 18,
      style: TextStyles.blackSize10Weight400,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 12, right: 6),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        hintText: 'Пол',
        hintStyle: TextStyles.textFieldHintStyle,
        filled: true,
        fillColor: AppColors.textFieldFillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      items: dropdownItems,
      onChanged: (value) => model.setGender(value),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Email',
      controller: model.emailTextController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Пароль',
      isObscured: true,
      controller: model.passwordTextController,
      textInputAction: TextInputAction.next,
    );
  }
}

class _RepeatPasswordFieldWidget extends StatelessWidget {
  const _RepeatPasswordFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return InputTextField(
      hintText: 'Повторите пароль',
      isObscured: true,
      controller: model.repeatPasswordTextController,
    );
  }
}

class _RegistrationButtonWidget extends StatelessWidget {
  const _RegistrationButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegistrationModel>();
    final onPressed = model.canStartRegistration == true
        ? () => model.register(context)
        : null;
    final child = model.isRegistrationProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
            'Зарегистрироваться',
            style: TextStyles.whiteSize10Weight700,
          );
    return SizedBox(
      height: 28,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyles.purpleOutlinedButton,
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Попробовать сделать ErrorMessage универсальным
    final errorMessage =
        context.select((RegistrationModel vm) => vm.errorMessage);
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