import 'package:flutter/material.dart';
import 'package:mobile_client/navigation/main_navigation.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);
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
          onTap: () => Navigator.of(context).pushNamed(Screens.personalMessages),
          child: const _ChatCardWidget(),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
    );
  }
}

class _ChatCardWidget extends StatelessWidget {
  const _ChatCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Имя пользователя',
                style: TextStyles.bodyWhite,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Содержание последнего сообщения, пишу, чтобы посмотреть',
                style: TextStyles.hintWhite,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: const [
            SizedBox(height: 20),
            Text(
              '15:30',
              style: TextStyles.hintWhite,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
