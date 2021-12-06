import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/box_shadows.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

class EssaysListWidget extends StatelessWidget {
  const EssaysListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:
            12, //временно, будет изменяться пользователем при редактировании профиля
        itemBuilder: (context, index) {
          return const _EssayRowWidget();
        });
  }
}

class _EssayRowWidget extends StatelessWidget {
  const _EssayRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      boxShadow: BoxShadows.boxShadowForGradientField,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      gradient: AppColors.essayThemeGradient,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: DecoratedBox(
        decoration: boxDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.tag),
              const Expanded(
                child: Text(
                  'Заголовок',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.whiteSize16,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                splashRadius: 1,
                constraints: const BoxConstraints(
                  minHeight: 0,
                  minWidth: 0,
                ),
                padding: const EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
