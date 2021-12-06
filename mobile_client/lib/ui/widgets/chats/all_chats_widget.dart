import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemExtent: 100,
              shrinkWrap: true,
              itemCount:
                  8, //TODO: временно, будет изменяться при увеличении количества диалогов
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        _Chat(
                          chatName:
                              'Имя пользователя', //TODO:  это - данные для примера, в дальнейшем надо реальные
                          header: 'заголовок',
                          time: '12:45',
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

class _Chat extends StatelessWidget {
  final String chatName;
  final String header;
  final String time;

  const _Chat({
    Key? key,
    required this.chatName,
    required this.header,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 4)),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(130, 97, 230, 1),
                      Color.fromRGBO(141, 63, 191, 1),
                    ],
                    begin: Alignment(-0.8, -1),
                    end: Alignment(1, 1),
                  )),
              child: SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 64,
                        width: 64,
                        child: Placeholder(),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                  text: chatName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                            ),
                            RichText(
                              maxLines: 1,
                              text: TextSpan(
                                  text: header,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 52),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                              text: time,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: -7,
          top: -2,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
            color: Colors.white,
            iconSize: 16,
          ),
        ),
      ],
    );
  }
}
