import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';

class PersonalMessagesWidget extends StatelessWidget {
  const PersonalMessagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final messageBubbleWidth = screenWidth * 3 / 4;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const _AppBarTitleWidget(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            color: Color.fromRGBO(20, 0, 255, 0.26),
            height: 0,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecorations.scaffoldGradient,
        // child: ListView(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        //       child: Column(
        //         children: [
        //           DecoratedBox(
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(4),
        //             ),
        //             child: Text('Для проверки'),
        //           ),
        //           const SizedBox(height: 16),
        //           DecoratedBox(
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(4),
        //             ),
        //             child: Text('Для проверки'),
        //           ),
        //           const SizedBox(height: 24),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        child: Stack(
          children: [
            //TODO не обернул в паддинг стек потому что пока не разобрался как по-другому сделать отправку сообщения, она двигается вмесет со всем контенотом и остается отступ снизу
            SafeArea(
              child: ListView(
                children: [
                  Padding(
                    //TODO Разобраться с нижним паддингом
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
                    child: ListView.builder(
                      itemCount: messages.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Align(
                            alignment:
                                (messages[index].messageType == "receiver"
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: messageBubbleWidth),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                messages[index].messageContent,
                                style: TextStyles.bodyBlack,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                height: 56,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Введите текст сообщения",
                            hintStyle: TextStyles.textFieldHint,
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppImages.sendIcon),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarTitleWidget extends StatelessWidget {
  const _AppBarTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
        ),
        //TODO Заменить аналогичные контейнеры на CircleAvatar
        // Container(
        //   width: 40,
        //   height: 40,
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //     shape: BoxShape.circle,
        //   ),
        // ),
        const SizedBox(width: 8),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Старый друг',
              style: TextStyles.headline7White,
            ),
            Text(
              'Бизнес',
              style: TextStyles.hintBlack,
            ),
          ],
        ))
      ],
    );
  }
}

//TODO Все, что ниже, временная мера, чтобы проверить верстку
class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent:
          "Дружище, приветствую тебя. Пишу по важному вопросу: у тебя не будет пары коров? Хочу открыть свой модный дом, начну изготавливать изделия из кожи...",
      messageType: "receiver"),
  ChatMessage(
      messageContent:
          "Здарова, старина. Давно, конечно, ты на связь не выходил, и тут с таким вопросом с порога. В начале пандемии мой бизнес обанкротился, так что теперь я развожу не крупный скот, а бабушек на деньги. ",
      messageType: "sender"),
  ChatMessage(messageContent: "Мда, трэш", messageType: "receiver"),
  ChatMessage(
      messageContent:
          "И давно ты стал таким подонком? Мы ж со школьной скамьи знакомы, все школьные годы мне учителя и родители тебя в пример ставили",
      messageType: "receiver"),
  ChatMessage(
      messageContent:
          "Это шутка, дядь. Я теперь в IT. Коров разводить - негуманно и неэкологично. ",
      messageType: "sender"),
  ChatMessage(messageContent: "Шей из заменителей", messageType: "sender"),
  ChatMessage(
      messageContent: "Ты как всегда прав. Спасибо, бывай!",
      messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];
