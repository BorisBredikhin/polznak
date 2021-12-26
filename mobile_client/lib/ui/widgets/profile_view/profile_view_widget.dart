import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/profile_view/essays_list_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.scaffoldGradient,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: const [
                  _MainInformationWidget(),
                  SizedBox(height: 24),
                  _SectionTitleWidget(title: 'Аккаунт'),
                  _UsernameWidget(),
                  _PurpleDividerWidget(),
                  _EmailWidget(),
                  _PurpleDividerWidget(),
                  _AboutMeWidget(),
                  _SectionTitleWidget(title: 'Личные данные'),
                  SizedBox(height: 16),
                  _PersonalDataWidget(),
                  SizedBox(height: 24),
                  _SectionTitleWidget(title: 'Мои эссе'),
                  SizedBox(height: 16),
                  EssaysListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainInformationWidget extends StatelessWidget {
  const _MainInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ProfileAvatar(),
        SizedBox(height: 16),
        Text(
          'Иванов Иван',
          style: TextStyles.headline5White,
        ),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return Stack(
      fit: StackFit.loose,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        Positioned(
          right: 24,
          top: 0,
          child: TextButton(
            onPressed: () => model.redactionOnPressed(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.mode_sharp,
                color: Colors.black,
              ),
            ),
          ),
          // child: IconButton(
          //   iconSize: 24,
          //   padding: EdgeInsets.zero,
          //   onPressed: () => model.redactionOnPressed(context),
          //   icon: const Icon(Icons.mode_sharp),
          // ),
        ),
      ],
    );
  }
}

class _PersonalDataWidget extends StatelessWidget {
  const _PersonalDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => model.redactionOnPressed(context),
          child: Column(
            children: [
              Image.asset(AppImages.personalDataGender),
              const SizedBox(height: 8),
              const Text(
                'Мужчина',
                style: TextStyles.bodyWhite,
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        InkWell(
          onTap: () => model.redactionOnPressed(context),
          child: Column(
            children: [
              Image.asset(AppImages.personalDataDateOfBirth),
              const SizedBox(height: 8),
              const Text(
                '11.11.1971',
                style: TextStyles.bodyWhite,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UsernameWidget extends StatelessWidget {
  const _UsernameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return InkWell(
      //TODO onTap
      onTap: () => model.redactionOnPressed(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Text(
            'Имя пользователя',
            style: TextStyles.hintWhite,
          ),
          SizedBox(height: 8),
          Text(
            'usernameExample',
            style: TextStyles.bodyWhite,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return InkWell(
      //TODO onTap
      onTap: () => model.redactionOnPressed(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Text(
            'Адрес электронной почты',
            style: TextStyles.hintWhite,
          ),
          SizedBox(height: 8),
          Text(
            '1034example@mail.ru',
            style: TextStyles.bodyWhite,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _AboutMeWidget extends StatelessWidget {
  const _AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return InkWell(
      //TODO onTap
      onTap: () => model.redactionOnPressed(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Text(
            'О себе',
            style: TextStyles.hintWhite,
          ),
          SizedBox(height: 8),
          Text(
            'Этот текст написан для демонстрации раздела с дополнительной информацией о пользователе',
            style: TextStyles.bodyWhite,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _SectionTitleWidget extends StatelessWidget {
  final String title;

  const _SectionTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: TextStyles.headline6White,
          ),
        ),
        Expanded(child: divider),
      ],
    );
  }
}

class _PurpleDividerWidget extends StatelessWidget {
  const _PurpleDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(20, 0, 255, 0.26),
      height: 1,
    );
  }
}
