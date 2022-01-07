import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/chats/chats_model.dart';
import 'package:mobile_client/ui/widgets/chats/popular_chats_widget.dart';
import 'package:provider/src/provider.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecorations.scaffoldGradient,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Активные',
                        style: TextStyles.bodyWhite,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const PopularChatsWidget(),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Text(
                        'Беседы',
                        style: TextStyles.bodyWhite,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ChatsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatsWidget extends StatelessWidget {
  const _ChatsWidget({Key? key}) : super(key: key);
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
    final model = context.watch<ChatsModel>();

    final interlocutorInfo = model.getInterlocutorInfo(index);
    if (interlocutorInfo == null) return const SizedBox.shrink();
    final interlocutorFullName =
        interlocutorInfo.user.firstName + ' ' + interlocutorInfo.user.lastName;

    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
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
              _MessageBodyWidget(index: index),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            const SizedBox(height: 20),
            _MessageTimeWidget(index: index),
          ],
        ),
      ],
    );
  }
}

class _MessageBodyWidget extends StatelessWidget {
  final int index;
  const _MessageBodyWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatsModel>();
    final lastMessagesList = model.lastMessagesInEachConversation;

    final conversationId = model.conversations[index].id;
    final lastMessage = lastMessagesList[conversationId];
    final messageBody =
        lastMessage == null ? 'Начните общение прямо сейчас' : lastMessage.body;
    return Text(
      messageBody,
      style: TextStyles.hintWhite,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _MessageTimeWidget extends StatelessWidget {
  final int index;
  const _MessageTimeWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ChatsModel>();
    final lastMessagesList = model.lastMessagesInEachConversation;

    final conversationId = model.conversations[index].id;
    final lastMessage = lastMessagesList[conversationId];
    final messageTime = lastMessage == null
        ? ''
        : lastMessage.sendAt.split('T')[1].substring(0, 5);
    return Text(
      messageTime,
      style: TextStyles.hintWhite,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}






//TODO TabBar если останется время
// class _Chats extends StatefulWidget {
//   const _Chats({Key? key}) : super(key: key);

//   @override
//   __ChatsState createState() => __ChatsState();
// }

// class __ChatsState extends State<_Chats> with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TabBar(
//           controller: _tabController,
//           indicatorWeight: 1,
//           tabs: const [
//             Tab(
//               height: 24,
//               child: Text(
//                 'Непрочитанные',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   height: 1.25,
//                 ),
//               ),
//             ),
//             Tab(
//               height: 24,
//               child: Text(
//                 'Все',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   height: 1.25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         //TODO Важно ограничить размеры как-то
//         SizedBox(
//           width: 100,
//           height: 100,
//           child: TabBarView(
//             controller: _tabController,
//             children: const [
//               Text("It's cloudy here"),
//               Text("It's rainy here"),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
