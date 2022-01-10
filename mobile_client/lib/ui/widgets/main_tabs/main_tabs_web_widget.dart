import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/screen_factory/screen_factory.dart';

class MainTabsWebWidget extends StatelessWidget {
  const MainTabsWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final _screenFactory = ScreenFactory();
    return _screenFactory.makeFeed();
  }
}

// class _BodyWidget extends StatelessWidget {
//   const _BodyWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final currentTabIndex =
//         context.select((MainTabsViewModel vm) => vm.currentTabIndex);
//     final _screenFactory = ScreenFactory();
//     return IndexedStack(
//       index: currentTabIndex,
//       children: [
//         // _screenFactory.makeFeed(),
//         const Center(child: Text('Поиск')),
//         _screenFactory.makeEssayCreation(),
//         _screenFactory.makeChats(),
//         _screenFactory.makeProfileView(),
//       ],
//     );
//   }
// }