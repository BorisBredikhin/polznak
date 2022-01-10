import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_model.dart';
import 'package:provider/provider.dart';

class PersonalMessagesWebWidget extends StatelessWidget {
  const PersonalMessagesWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecorations.scaffoldGradient,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 430,
            height: 753.5,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: const BackButton(color: Colors.purple),
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const _AppBarTitleWidget(),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Divider(
                    color: Colors.purple,
                    height: 0,
                  ),
                ),
              ),
              body: DecoratedBox(
                decoration: BoxDecorations.whiteScaffold,
                child: Stack(
                  children: const [
                    _MessagesListWidget(),
                    _MessageInputWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
    return InkWell(
      onTap: () => model.onProfileTap(context),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple,
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                interlocutorFullName,
                style: TextStyles.headline7Purple,
              ),
              const Text(
                'Бизнес',
                style: TextStyles.hintWhite,
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class _MessagesListWidget extends StatelessWidget {
  const _MessagesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final messageBubbleWidth = screenWidth * 3 / 4;
    final model = context.watch<PersonalMessagesModel>();
    final messagesList = model.messagesList;
    final scrollController = model.scrollController;
    if (model.isLoadingProgress) {
      return const SizedBox(
        child: Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    } else if (messagesList.isEmpty) {
      return const Center(
        child: Text(
          'Сообщений пока нет. Начните общение прямо сейчас.',
          style: TextStyles.bodyPurple,
          textAlign: TextAlign.center,
        ),
      );
    }
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 60),
        controller: scrollController,
        reverse: true,
        itemCount: messagesList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _MessageBubbleWidget(
            index: index,
            messageBubbleWidth: messageBubbleWidth,
          );
        },
      ),
    );
  }
}

class _MessageBubbleWidget extends StatelessWidget {
  const _MessageBubbleWidget({
    Key? key,
    required this.index,
    required this.messageBubbleWidth,
  }) : super(key: key);

  final int index;
  final double messageBubbleWidth;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonalMessagesModel>();
    final messagesList = model.messagesList;
    if (messagesList.isEmpty) return const SizedBox.shrink();

    final userInfo = model.userInfo;
    if (userInfo == null) return const SizedBox.shrink();

    final alignment = messagesList[index].sender == userInfo.id
        ? Alignment.topRight
        : Alignment.topLeft;

    final messageBody = messagesList[index].body;
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: alignment,
        child: Container(
          constraints: BoxConstraints(maxWidth: messageBubbleWidth),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.purple,
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            messageBody,
            style: TextStyles.bodyWhite,
          ),
        ),
      ),
    );
  }
}

class _MessageInputWidget extends StatelessWidget {
  const _MessageInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PersonalMessagesModel>();
    return Align(
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
    );
  }
}
