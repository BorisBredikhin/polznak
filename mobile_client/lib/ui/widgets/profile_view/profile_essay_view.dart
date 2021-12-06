import 'package:flutter/material.dart';

class EssaysView extends StatelessWidget {
  const EssaysView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  3, //временно, будет изменяться пользователем при редактировании профиля
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              const SizedBox(
                                width: 350,
                                child: _EssayTextField(
                                  text: 'Заголовок',
                                  suffixIcon: Icons.tag,
                                ),
                              ),
                              Positioned(
                                bottom: -6,
                                right: 6,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search),
                                  splashRadius: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class _EssayTextField extends StatelessWidget {
  final int? maxLines;
  final IconData? suffixIcon;
  final TextStyle? textStyle;
  final String text;

  const _EssayTextField({
    Key? key,
    this.maxLines = 1,
    this.suffixIcon,
    this.textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 4)),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(140, 111, 221, 0.7),
                  Color.fromRGBO(148, 56, 194, 0.7),
                ],
                begin: Alignment(-0.8, -1),
                end: Alignment(1, 1),
              )),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: SizedBox(
              width: 310,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(suffixIcon),
                  RichText(
                    maxLines: maxLines,
                    text: TextSpan(text: text, style: textStyle),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
