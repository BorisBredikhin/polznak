import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/web_app_bar_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_client/ui/widgets/profile_view/essay_web_list_widget.dart';

class ProfileViewWebWidget extends StatelessWidget {
  const ProfileViewWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: WebAppBarWidget(context: context, barElementIndex: 3),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecorations.scaffoldGradient,
          child: Column(
            children: [
              SizedBox(
                width: 1024,
                height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      IconButton(
                        onPressed: () => model.redactionOnPressed(context),
                        icon: const Icon(Icons.mode),
                        color: Colors.purple,
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout),
                        onPressed: () => model.logout(context),
                        color: Colors.purple,
                      ),
                    ],
                  ),
                  body: DecoratedBox(
                    decoration: BoxDecorations.whiteScaffold,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 24, top: 0),
                          child: Column(
                            children: const [
                              _MainInformationWidget(),
                              SizedBox(height: 24),
                              _SectionTitleWidget(title: '??????????????'),
                              _UsernameWidget(),
                              _PurpleDividerWidget(),
                              _EmailWidget(),
                              _PurpleDividerWidget(),
                              _AboutMeWidget(),
                              _SectionTitleWidget(title: '???????????? ????????????'),
                              SizedBox(height: 16),
                              _PersonalDataWidget(),
                              // SizedBox(height: 24),
                              // _SectionTitleWidget(title: '?????? ????????'),
                              // SizedBox(height: 16),
                              // WebEssaysListWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class _MainInformationWidget extends StatelessWidget {
  const _MainInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileViewModel>();
    final userInfo = model.userInfo;
    if (userInfo == null) return const SizedBox.shrink();
    final userFullName = userInfo.user.firstName + ' ' + userInfo.user.lastName;
    return Column(
      children: [
        const _ProfileAvatar(),
        const SizedBox(height: 16),
        Text(
          userFullName,
          style: TextStyles.headline5Purple,
        ),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.purple,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _PersonalDataWidget extends StatelessWidget {
  const _PersonalDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileViewModel>();
    final userInfo = model.userInfo;
    if (userInfo == null) return const SizedBox.shrink();
    final gender = userInfo.gender == 'M' ? '??????????????' : '??????????????';
    final birthDate = userInfo.birthDate;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => model.redactionOnPressed(context),
          child: Column(
            children: [
              Image.asset(AppImages.personalDataGender),
              const SizedBox(height: 8),
              Text(
                gender,
                style: TextStyles.bodyPurple,
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
              Text(
                birthDate,
                style: TextStyles.bodyPurple,
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
    final model = context.watch<ProfileViewModel>();
    final userInfo = model.userInfo;
    if (userInfo == null) return const SizedBox.shrink();
    final username = userInfo.user.username;
    return InkWell(
      onTap: () => model.redactionOnPressed(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          const Text(
            '?????? ????????????????????????',
            style: TextStyles.hintPurple,
          ),
          const SizedBox(height: 8),
          Text(
            username,
            style: TextStyles.bodyPurple,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileViewModel>();
    final userInfo = model.userInfo;
    if (userInfo == null) return SizedBox.shrink();
    final email = userInfo.user.email;
    return InkWell(
      //TODO onTap
      onTap: () => model.redactionOnPressed(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          const Text(
            '?????????? ?????????????????????? ??????????',
            style: TextStyles.hintPurple,
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyles.bodyPurple,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _AboutMeWidget extends StatelessWidget {
  const _AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileViewModel>();
    final userInfo = model.userInfo;
    if (userInfo == null) return SizedBox.shrink();
    final details =
        userInfo.details.isEmpty ? '???????????????????? ???? ??????????????????' : userInfo.details;
    return InkWell(
      //TODO onTap
      onTap: () => model.redactionOnPressed(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          const Text(
            '?? ????????',
            style: TextStyles.hintPurple,
          ),
          const SizedBox(height: 8),
          Text(
            details,
            style: TextStyles.bodyPurple,
          ),
          const SizedBox(height: 24),
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
      color: Colors.purple,
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
            style: TextStyles.headline6Purple,
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
      color: Colors.purple,
      height: 1,
    );
  }
}
