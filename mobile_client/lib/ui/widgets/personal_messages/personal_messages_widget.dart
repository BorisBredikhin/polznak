import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_model.dart';
import 'package:provider/provider.dart';

class PersonalMessagesWidget extends StatelessWidget {
  const PersonalMessagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final messageBubbleWidth = screenWidth * 3 / 4;
    final model = context.watch<PersonalMessagesModel>();
    final messagesList = model.messagesList;
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
        child: Stack(
          children: [
            //TODO не обернул в паддинг стек потому что пока не разобрался как по-другому сделать отправку сообщения, она двигается вмесет со всем контенотом и остается отступ снизу
            SafeArea(
              child: ListView(
                children: [
                  //TODO Времееный виджет об отсутствии сообщений, исправить после рефаткоринга
                  _EmptyMessageListWidget(),
                  Padding(
                    //TODO Разобраться с нижним паддингом
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
                    child: ListView.builder(
                      reverse: true,
                      itemCount: messagesList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final model = context.watch<PersonalMessagesModel>();
                        final userInfo = model.userInfo;
                        if (userInfo == null || messagesList.isEmpty)
                          return const SizedBox.shrink();
                        final alignment = messagesList[index].sender ==
                                    userInfo.id
                                ? Alignment.topRight
                                : Alignment.topLeft;
                        final messageBody = messagesList[index].body;   
                        return Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Align(
                            alignment: alignment,
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: messageBubbleWidth),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                messageBody,
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
                    Expanded(
                      child: TextField(
                        controller: model.messageTextController,
                        decoration: const InputDecoration(
                            hintText: "Введите текст сообщения",
                            hintStyle: TextStyles.textFieldHint,
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => model.sendMessage(),
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

class _EmptyMessageListWidget extends StatelessWidget {
  const _EmptyMessageListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonalMessagesModel>();
    final messagesList = model.messagesList;
    if (messagesList.isEmpty) {
      return Center(
        child: Text('Сообщений пока нет'),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class _AppBarTitleWidget extends StatelessWidget {
  const _AppBarTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonalMessagesModel>();
    final interlocutorInfo = model.interlocutorInfo;
    if (interlocutorInfo == null) return const SizedBox.shrink();
    final interlocutorFullName =
        interlocutorInfo.user.firstName + ' ' + interlocutorInfo.user.lastName;
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
          // decoration: const BoxDecoration(
          //   color: Colors.white,
          //   shape: BoxShape.circle,
        //   ),
        // ),
        const SizedBox(width: 8),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              interlocutorFullName,
              style: TextStyles.headline7White,
            ),
            const Text(
              'Бизнес',
              style: TextStyles.hintBlack,
            ),
          ],
        ))
      ],
    );
  }
}
