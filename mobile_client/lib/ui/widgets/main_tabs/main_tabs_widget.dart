import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_view_model.dart';
import 'package:mobile_client/ui/widgets/screen_factory/screen_factory.dart';
import 'package:provider/provider.dart';

class MainTabsWidget extends StatelessWidget {
  const MainTabsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      // extendBody: true,
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () => model.logout(context),
      //     ),
      //   ],
      // ),
      body: const _BodyWidget(),
      bottomNavigationBar: const _BottomNavigationBarWidget(),
      // floatingActionButton: Visibility(
      //   visible: !keyboardIsOpen,
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: const Icon(Icons.add_circle_outline),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTabIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    final _screenFactory = ScreenFactory();
    return IndexedStack(
      index: currentTabIndex,
      children: [
        _screenFactory.makeFeed(),
        const Center(child: Text('Поиск')),
        _screenFactory.makeEssayCreation(),
        _screenFactory.makeChats(),
        _screenFactory.makeProfileView(),
      ],
    );
  }
}

class _BottomNavigationBarWidget extends StatelessWidget {
  const _BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    final cuurentIndex =
        context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: cuurentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Лента',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Поиск',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Эссе',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline_rounded),
          label: 'Беседы',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Профиль',
        ),
      ],
      onTap: model.setCurrentTabIndex,
    );
    // final model = context.read<MainTabsViewModel>();
    // final cuurentIndex =
    //     context.select((MainTabsViewModel vm) => vm.currentTabIndex);
    // return BottomAppBar(
    //   color: Colors.transparent,
    //   child: IconTheme(
    //     data: IconThemeData(),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         IconButton(
    //           icon: Icon(Icons.home),
    //           onPressed: () => model.setCurrentTabIndex(0),
    //           color: Colors.white,
    //         ),
    //         IconButton(
    //           icon: const Icon(Icons.search),
    //           onPressed: () => model.setCurrentTabIndex(1),
    //         ),
    //         SizedBox(),
    //         IconButton(
    //           icon: Icon(Icons.chat_bubble_outline_rounded),
    //           onPressed: () => model.setCurrentTabIndex(2),
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.person),
    //           onPressed: () => model.setCurrentTabIndex(3),
    //         ),
    //       ],
    //     ),
    //   ),
    //   notchMargin: 2,
    //   shape: const CircularNotchedRectangle(),
    // );
  }
}
