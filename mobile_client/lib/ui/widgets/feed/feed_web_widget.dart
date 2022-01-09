import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/feed/feed_model.dart';
import 'package:provider/provider.dart';

//TODO Доработать верстку ленты
class FeedWebWidget extends StatelessWidget {
  const FeedWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingButtonsWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 128),
              child: _PublicationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PublicationWidget extends StatelessWidget {
  const _PublicationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FeedModel>();
    //TODO Подумать, как можно исправить
    final post = model.getCurrentPost();
    // if (post == null) return const _ErrorMessageWidget();
    if (post == null) {
      final screenHeight = MediaQuery.of(context).size.height - 56;
      return SizedBox(
        height: screenHeight,
        child: const Center(
          child: Text(
            'Вы посмотрели все доступные публикации',
            style: TextStyles.headline7Black,
          ),
        ),
      );
    }
    return Column(
      children: [
        const Text(
          'Тема',
          style: TextStyles.headline6Black,
        ),
        Text(
          post.title,
          style: TextStyles.headline7Black,
        ),
        //TODO Не получается сделать расстоние между абзацами, равное пустой строке
        Text(
          post.content,
          // 'Пример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.\n\nЕще не очень нравится выравнивание по левому краю, но выравнивание по ширине еще некрасивее, так что терпим. Пример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.\n\nПример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.\n\nЕще не очень нравится выравнивание по левому краю, но выравнивание по ширине еще некрасивее, так что терпим. Пример текста Эссе. Пишу этот текст, чтоб посмотреть, как будут выглядеть переносы. Кажется, приемлемо. В любом случае получается куда лучше, чем было.\n\nИнтересно получаются переносы - будто бы один абзац остается пустым. Надо посмотреть, как это исправить. Думаю, в верстке непосредственно вряд ли столкнемся с этим, так что приоритет не самый высокий.',
          style: TextStyles.bodyBlack,
        ),
      ],
    );
  }
}

class _FloatingButtonsWidget extends StatelessWidget {
  const _FloatingButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FeedModel>();
    final post = model.getCurrentPost();
    if (post == null) return const _ErrorMessageWidget();
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
                onPressed:() => model.sendLikeOrDislike(false, post.id),
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
                onPressed: () => model.sendLikeOrDislike(true, post.id),
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
