import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

class PopularChatsWidget extends StatelessWidget {
  const PopularChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(154, 159, 237, 1),
            Color.fromRGBO(140, 103, 217, 1),
          ],
          begin: Alignment(-0.8, -1),
          end: Alignment(1, 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(1, 4),
          )
        ],
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              6, //TODO: временное число, будет зависеть от количества диалогов
          itemExtent: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: const [
                  PopularChat(
                    chatName: 'Имя пользователя',
                  ),
                ],
              ),
            );
          }),
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
    return SizedBox(
      width: 90,
      height: 120,
      child: InkWell(
        onTap: () {}, //TODO: настроить клик
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            const SizedBox(
              width: 64,
              height: 64,
              child: Placeholder(), //(avatar)
            ),
            RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: chatName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
