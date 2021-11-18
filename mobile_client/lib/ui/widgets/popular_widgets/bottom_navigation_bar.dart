import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_widget.dart';
import 'package:mobile_client/ui/widgets/main_screen/main_screen_widget.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedTab = 0;
  static const List<Widget> _WidgetOptions = <Widget>[
    MainScreenWidget(),
    Text('search'),
    EssayCreationWidget(),
    Text('chats'),
    Text('Profile')
  ];

  void _onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          _HomePage(),
          _Search(),
          _Essay(),
          _Chats(),
          _Profile(),
        ],
        onTap: _onSelectTab,
      ),
    );
  }

  BottomNavigationBarItem _Profile() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Профиль',
    );
  }

  BottomNavigationBarItem _Chats() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline_rounded),
      label: 'Беседы',
    );
  }

  BottomNavigationBarItem _Essay() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline),
      label: 'Эссе',
    );
  }

  BottomNavigationBarItem _Search() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Поиск',
    );
  }

  BottomNavigationBarItem _HomePage() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Лента',
    );
  }
}
