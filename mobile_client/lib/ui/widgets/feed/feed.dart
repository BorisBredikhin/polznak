import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.backgroundGradient,
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Publication(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Publication extends StatelessWidget {
  const Publication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(22, 1, 255, 0.2),
                Color.fromRGBO(255, 0, 214, 0.15),
              ],
              begin: Alignment(-0.8, -1),
              end: Alignment(1, 1),
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Тема',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Заголовок',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              const SizedBox(height: 10),
              PublicationText(),
              const SizedBox(height: 6),
              Divider(),
              ButtonBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class PublicationText extends StatelessWidget {
  const PublicationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromRGBO(22, 1, 255, 0.15),
                Color.fromRGBO(255, 0, 214, 0.1),
              ],
              begin: Alignment(-0.8, -1),
              end: Alignment(1, 1),
            )),
        child: SizedBox(
          width: double.infinity,
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: RichText(
                text: TextSpan(
                  text:
                      ' текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи  текст статьи текст статьи текст статьи текст статьи текст статьи ',
                  style: TextStyle(fontSize: 14),
                ),
                maxLines: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonBar extends StatelessWidget {
  const ButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(22, 1, 255, 0.01),
            Color.fromRGBO(255, 0, 214, 0.01),
          ],
          begin: Alignment(-0.8, -1),
          end: Alignment(1, 1),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down_alt_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.comment),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up_alt),
            ),
          ],
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  final _divider = Container(
    color: const Color.fromRGBO(22, 1, 255, 0.5),
    height: 1,
  );

  Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _divider),
      ],
    );
  }
}
