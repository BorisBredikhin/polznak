import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<RegistrationModel>(context);
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
            children: [
              const _ErrorMessageWidget(),
              InputTextField(
                hintText: 'Имя',
                controller: model?.firstNameTextController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              InputTextField(
                hintText: 'Фамилия',
                controller: model?.lastNameTextController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              InputTextField(
                hintText: 'Имя пользователя',
                controller: model?.userameTextController,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              InputTextField(
                hintText: 'Дата рождения',
                suffixIcon: const Icon(Icons.calendar_today),
                controller: model?.dateOfBirthTextController,
                keyboardType: TextInputType.none,
                onTap: () => model?.selectDate(context),
              ),
              const SizedBox(height: 6),
              const _GenderChoiceWidget(),
              const SizedBox(height: 6),
              InputTextField(
                hintText: 'Email',
                controller: model?.emailTextController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              InputTextField(
                hintText: 'Пароль',
                isObscured: true,
                controller: model?.passwordTextController,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 6),
              InputTextField(
                hintText: 'Повторите пароль',
                isObscured: true,
                controller: model?.repeatPasswordTextController,
              ),
              const SizedBox(height: 6),
              const _RegistrationButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenderChoiceWidget extends StatelessWidget {
  const _GenderChoiceWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<RegistrationModel>(context);
    return DropdownButtonFormField<String>(
      iconSize: 18,
      style: const TextStyle(
        fontSize: 10,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 12, right: 6),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        hintText: 'Пол',
        hintStyle: const TextStyle(
          fontSize: 9,
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(244, 244, 244, 1),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      items: ["Мужчина", "Женщина"]
          .map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              ))
          .toList(),
      onChanged: (value) => model?.setGender(value!),
    );
  }
}

class _RegistrationButtonWidget extends StatelessWidget {
  const _RegistrationButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<RegistrationModel>(context);
    final onPressed = model?.canStartRegistration == true
        ? () => model?.register(context)
        : null;
    final child = model?.isRegistrationProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
            'Зарегистрироваться',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
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
            const EdgeInsets.symmetric(vertical: 6),
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
        NotifierProvider.watch<RegistrationModel>(context)?.errorMessage;
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
