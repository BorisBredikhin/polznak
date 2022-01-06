import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

class PopularChatsWidget extends StatelessWidget {
  const PopularChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount:
            6, //TODO временное число, будет зависеть от количества диалогов
        itemBuilder: (BuildContext context, int index) {
          return const PopularChat(
            chatName: 'Имя пользователя',
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }
}

class PopularChat extends StatelessWidget {
  final String chatName;
  //final Image avatar;

  const PopularChat({
    Key? key,
    required this.chatName, //this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, //TODO: настроить клик
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 56,
            child: Text(
              chatName,
              style: TextStyles.hintWhite,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
