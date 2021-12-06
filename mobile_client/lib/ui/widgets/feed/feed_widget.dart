import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/feed/feed_model.dart';
import 'package:provider/provider.dart';

//TODO Доработать верстку ленты
class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.backgroundGradient,
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      _Publication(),
                    ],
                  ),
                ),
              ],
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
                  text: post?.content,
                  style: const TextStyle(fontSize: 14),
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
