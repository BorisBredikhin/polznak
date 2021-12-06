import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/box_shadows.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_model.dart';
import 'package:provider/provider.dart';

class ViewProfileInfoWidget extends StatelessWidget {
  const ViewProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.profileInfoGradient),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            SizedBox(height: 8),
            _ProfileAvatar(),
            SizedBox(height: 40),
            _TextBoxWidget(
              text: 'Имя пользователя',
            ),
            SizedBox(height: 10),
            _TextBoxWidget(
              text: 'О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе ',
            ),
          ],
        ),
      ),
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
          children: const [
            AppLogoWidget(),
          ],
        ),
        Positioned(
          right: -10,
          top: -15,
          child: IconButton(
            iconSize: 24,
            padding: EdgeInsets.zero,
            onPressed: () => model.redactionOnPressed(context),
            icon: const Icon(Icons.mode_sharp),
          ),
        ),
      ],
    );
  }
}

class _TextBoxWidget extends StatelessWidget {
  final String text;
  const _TextBoxWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: BoxShadows.boxShadowForGradientField,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        gradient: AppColors.usernameGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          text,
          style: TextStyles.whiteSize16,
        ),
      ),
    );
  }
}
