import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_model.dart';
import 'package:provider/provider.dart';

class ProfileRedactionFormWidget extends StatelessWidget {
  const ProfileRedactionFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecorations.formBackground,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: const [
            _ErrorMessageWidget(),
            _FirstNameFieldWidget(),
            SizedBox(height: 16),
            _LastNameFieldWidget(),
            SizedBox(height: 16),
            _UsernameFieldWidget(),
            SizedBox(height: 16),
            _DateOfBirthFieldWidget(),
            SizedBox(height: 16),
            _GenderChoiceWidget(),
            SizedBox(height: 16),
            _EmailTextFieldWidget(),
            SizedBox(height: 16),
            _DescriptionFieldWidget(),
            SizedBox(height: 16),
            _SaveButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _FirstNameFieldWidget extends StatelessWidget {
  const _FirstNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileRedactionModel>();
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
    final model = context.read<ProfileRedactionModel>();
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
    final model = context.read<ProfileRedactionModel>();
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
    final model = context.read<ProfileRedactionModel>();
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
    final model = context.watch<ProfileRedactionModel>();
    final dropdownItems = ['', "Мужчина", "Женщина"]
        .map((label) => DropdownMenuItem(
              child: Text(
                label,
                style: TextStyles.bodyBlack,
              ),
              value: label,
            ))
        .toList();
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<String>(
        iconSize: 24,
        style: TextStyles.bodyBlack,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: 'Пол',
          hintStyle: TextStyles.textFieldHint,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: AppColors.textFieldActive,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        value: model.genderTextController.text,
        items: dropdownItems,
        onChanged: (value) => model.setGender(value),
      ),
    );
  }
}

class _EmailTextFieldWidget extends StatelessWidget {
  const _EmailTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileRedactionModel>();
    return InputTextField(
      hintText: 'Email',
      controller: model.emailTextController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

class _DescriptionFieldWidget extends StatelessWidget {
  const _DescriptionFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileRedactionModel>();
    return InputTextField(
      hintText: 'О себе',
      isObscured: false,
      controller: model.descriptionTextController,
      height: 80,
      maxLines: 3,
      contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
    );
  }
}

class _SaveButtonWidget extends StatelessWidget {
  const _SaveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileRedactionModel>();
    final onPressed = model.canStartRegistration == true
        ? () {}
        : null;
    final child = model.isRegistrationProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
            'СОХРАНИТЬ',
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

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Попробовать сделать ErrorMessage универсальным
    final errorMessage =
        context.select((ProfileRedactionModel vm) => vm.errorMessage);
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
