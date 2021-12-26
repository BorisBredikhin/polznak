import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/chats/all_chats_widget.dart';
import 'package:mobile_client/ui/widgets/chats/popular_chats_widget.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.scaffoldGradient,
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
                  // _Chats(),
                  Row(
                    children: const [
                      Text(
                        'Беседы',
                        style: TextStyles.bodyWhite,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Chats(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO TabBar если останется время
class _Chats extends StatefulWidget {
  const _Chats({Key? key}) : super(key: key);

  @override
  __ChatsState createState() => __ChatsState();
}

class __ChatsState extends State<_Chats> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorWeight: 1,
          tabs: const [
            Tab(
              height: 24,
              child: Text(
                'Непрочитанные',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
            ),
            Tab(
              height: 24,
              child: Text(
                'Все',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        //TODO Важно ограничить размеры как-то
        SizedBox(
          width: 100,
          height: 100,
          child: TabBarView(
            controller: _tabController,
            children: const [
              Text("It's cloudy here"),
              Text("It's rainy here"),
            ],
          ),
        ),
      ],
    );
  }
}
