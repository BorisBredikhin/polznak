import 'package:flutter/material.dart';
import 'package:mobile_client/navigation/main_navigation.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

class WebAppBarWidget extends StatelessWidget {
  const WebAppBarWidget({
    Key? key,
    required this.context,
    required this.barElementIndex,
  }) : super(key: key);

  final BuildContext context;
  final int barElementIndex;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.purple),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(AppImages.webLogo),
          ),
          const SizedBox(
            width: 92,
            child: Text(
              'DISCUSS IT',
              style: TextStyles.headline6White,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 32),
          SizedBox(
            width: 360,
            height: 32,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                suffixIcon: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Icon(Icons.search),
                ),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                hintText: 'Текст для поиска',
                hintStyle: TextStyles.textFieldHint,
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 32),
          _NavigationButtonWidget(
              text: 'Лента',
              onPressed: () => Navigator.of(context).pushNamed(Screens.feed), isSelected: barElementIndex == 0),
          const SizedBox(width: 32),
          _NavigationButtonWidget(
              text: 'Эссе',
              onPressed: () =>
                  Navigator.of(context).pushNamed(Screens.essayCreation), isSelected: barElementIndex == 1),
          const SizedBox(width: 32),
          _NavigationButtonWidget(
              text: 'Беседы',
              onPressed: () => Navigator.of(context).pushNamed(Screens.chats), isSelected: barElementIndex == 2),
          const SizedBox(width: 96),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(Screens.profileView),
            child: const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _NavigationButtonWidget extends StatelessWidget {
  const _NavigationButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: isSelected ? TextStyles.headline5Black : TextStyles.headline5White,
      ),
    );
  }
}
