import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

class EssaysListWidget extends StatelessWidget {
  const EssaysListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          12, //TODO временно, будет изменяться пользователем при редактировании профиля
      itemBuilder: (context, index) {
        return InkWell(
          //TODO OnTap на каждое эссе
          onTap: () {},
          child: const _EssayCardWidget(),
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: const [
            SizedBox(height: 16),
            _EssayDividerWidget(),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class _EssayCardWidget extends StatelessWidget {
  const _EssayCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _PublicationTimeWidget(),
              SizedBox(height: 8),
              Text(
                'Заголовок эссе',
                style: TextStyles.headline7White,
              ),
              SizedBox(height: 8),
              Text(
                'Будет отображаться только одна строка текста, пишу его чтобы проверить, как лишний текст будет скрываться',
                style: TextStyles.hintWhite,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Image.asset(AppImages.chevronRight),
      ],
    );
  }
}

class _PublicationTimeWidget extends StatelessWidget {
  const _PublicationTimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.clock),
        const SizedBox(width: 8),
        const Text(
          '15.09.2021 21:17',
          style: TextStyles.hintWhite,
        ),
      ],
    );
  }
}

class _EssayDividerWidget extends StatelessWidget {
  const _EssayDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.25),
      height: 1,
    );
  }
}
