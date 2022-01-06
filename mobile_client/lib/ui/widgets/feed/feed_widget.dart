import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/feed/feed_model.dart';
import 'package:provider/provider.dart';

//TODO Доработать верстку ленты
class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingButtonsWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 128),
              child: Column(
                children: const [
                  Text(
                    'Тема',
                    style: TextStyles.headline6Black,
                  ),
                  Text(
                    'Заголовок',
                    style: TextStyles.headline7Black,
                  ),
                  //TODO Не получается сделать расстоние между абзацами, равное пустой строке
                  Text(
                    'Пример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.\n\nЕще не очень нравится выравнивание по левому краю, но выравнивание по ширине еще некрасивее, так что терпим. Пример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.\n\nПример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.\n\nЕще не очень нравится выравнивание по левому краю, но выравнивание по ширине еще некрасивее, так что терпим. Пример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.',
                    style: TextStyles.bodyBlack,
                  ),
                  // _Publication(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingButtonsWidget extends StatelessWidget {
  const _FloatingButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecorations.feedFloatingButtonsGradient,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                heroTag: 'btn1',
                onPressed: () {},
                child: const Icon(
                  Icons.thumb_down_rounded,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(width: 48),
            SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                heroTag: 'btn2',
                onPressed: () {},
                child: const Icon(
                  Icons.mode_comment,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(width: 48),
            SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                heroTag: 'btn3',
                onPressed: () {},
                child: const Icon(
                  Icons.thumb_up_rounded,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Publication extends StatelessWidget {
  const _Publication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FeedModel>();
    //TODO Подумать, как можно исправить
    final post = model.getCurrentPost();
    if (post == null) return const _ErrorMessageWidget();
    return Padding(
      padding: const EdgeInsets.symmetric(),
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _Divider(),
            const SizedBox(height: 10),
            const _PublicationText(),
            const SizedBox(height: 6),
            _Divider(),
            const _ButtonBar(),
          ],
        ),
      ),
    );
  }
}

class _PublicationText extends StatelessWidget {
  const _PublicationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FeedModel>();
    final post = model.getCurrentPost();
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SizedBox(
        width: double.infinity,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                text: post?.content,
                style: const TextStyle(fontSize: 14),
              ),
              maxLines: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonBar extends StatelessWidget {
  const _ButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FeedModel>();
    final post = model.getCurrentPost();
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
              onPressed: () => model.sendLikeOrDislike(false, post!.id),
              icon: const Icon(Icons.thumb_down_alt_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.comment),
            ),
            IconButton(
              onPressed: () => model.sendLikeOrDislike(true, post!.id),
              icon: const Icon(Icons.thumb_up_alt),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  final _divider = Container(
    color: const Color.fromRGBO(22, 1, 255, 0.5),
    height: 1,
  );

  _Divider({
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

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<FeedModel>();
    final errorMessage = context.select((FeedModel vm) => vm.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();
    return Column(
      children: [
        Text(
          errorMessage,
          style: TextStyles.errorTextStyle,
        ),
        ElevatedButton(
          onPressed: model.getPosts,
          child: const Text('Обновить'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
