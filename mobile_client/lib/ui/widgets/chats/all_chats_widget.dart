import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/chats/chats_model.dart';
import 'package:provider/provider.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatsModel>();
    final conversations = model.conversations;
    if (conversations.isEmpty) {
      return const Center(
        child: Text(
          'Здесь появятся ваши диалоги',
          style: TextStyles.bodyWhite,
        ),
      );
    }
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => model.onConversationTap(context, index),
          child: _ChatCardWidget(index: index),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
    );
  }
}

class _ChatCardWidget extends StatelessWidget {
  final int index;

  const _ChatCardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO По возможности отрефакторить
    final model = context.watch<ChatsModel>();
    final interlocutorInfo = model.getInterlocutorInfo(index);
    if (interlocutorInfo == null) return const SizedBox.shrink();
    final interlocutorFullName = interlocutorInfo.user.firstName + ' ' + interlocutorInfo.user.lastName;
    final conversationId = model.conversations[index].id;
    final lastMessagesList = model.lastMessagesInEachConversation;
    final message = lastMessagesList[conversationId];
    final messageBody = message == null ? 'Начните общение прямо сейчас' : message.body;
    final messageTime = message == null ? '' : message.sendAt.split('T')[1].substring(0, 5);
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
            children: [
              Text(
                interlocutorFullName,
                style: TextStyles.bodyWhite,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                messageBody,
                style: TextStyles.hintWhite,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            const SizedBox(height: 20),
            Text(
              messageTime,
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
