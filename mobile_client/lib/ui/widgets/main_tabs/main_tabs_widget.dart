import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_view_model.dart';
import 'package:mobile_client/ui/widgets/screen_factory/screen_factory.dart';
import 'package:provider/provider.dart';

class MainTabsWidget extends StatelessWidget {
  const MainTabsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _FigmaBottomBarWidget(),
    );
  }
}

class _FigmaBottomBarWidget extends StatelessWidget {
  const _FigmaBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    return DecoratedBox(
      decoration: BoxDecorations.bottomNavBarGradient,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              _BottomNavBarItem(index: 4, imageName: AppImages.homeIcon, label: 'Лента', onTap: () => model.feedButtonOnTap(context)),
              _BottomNavBarItem(index: 0, imageName: AppImages.searchIcon, label: 'Поиск', onTap: () => model.setCurrentTabIndex(0)),
              _BottomNavBarItem(index: 1, imageName: AppImages.addEssayIcon, label: 'Эссе', onTap: () => model.setCurrentTabIndex(1)),
              _BottomNavBarItem(index: 2, imageName: AppImages.chatsIcon, label: 'Беседы', onTap: () => model.setCurrentTabIndex(2)),
              _BottomNavBarItem(index: 3, imageName: AppImages.profileIcon, label: 'Профиль', onTap: () => model.setCurrentTabIndex(3)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    Key? key,
    required this.index,
    required this.imageName,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final String imageName;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainTabsViewModel>();
    final currentTabIndex = model.currentTabIndex;
    final Color color;
    final TextStyle textStyle;
    if (currentTabIndex == index) {
      color = Colors.black;
      textStyle = TextStyles.bottomBarSelectedLabel;
    }
    else {
      color = Colors.white;
      textStyle = TextStyles.bottomBarUnselectedLabel;
    }
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Image.asset(
                  imageName,
                  color: color,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      ),
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
        // _screenFactory.makeFeed(),
        const Center(child: Text('Поиск')),
        _screenFactory.makeEssayCreation(),
        _screenFactory.makeChats(),
        _screenFactory.makeProfileView(),
      ],
    );
  }
}