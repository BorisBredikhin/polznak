import 'package:flutter/material.dart';
import 'package:mobile_client/resources/resources.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/web_app_bar_widget.dart';
import 'package:provider/provider.dart';
import '../popular_widgets/purple_button_widget.dart';

class EssayCreationWebWidget extends StatelessWidget {
  const EssayCreationWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EssayCreationModel>();
    final onPressed =
        model.canStartSave == true ? () => model.savePost(context) : null;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: WebAppBarWidget(context: context, barElementIndex: 1),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecorations.scaffoldGradient,
          child: Column(
            children: [
              SizedBox(
                width: 1024,
                height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: const Text(
                      'Эссе',
                      style: TextStyles.headline6Purple,
                    ),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: Divider(
                        color: Colors.purple,
                        height: 0,
                      ),
                    ),
                  ),
                  body: DecoratedBox(
                    decoration: BoxDecorations.whiteScaffold,
                    child: SafeArea(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Column(
                              children: [
                                const _ErrorMessageWidget(),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: InputTextField(
                                    controller: model.titleTextController,
                                    hintText: 'Введите заголовок',
                                  ),
                                ),
                                const SizedBox(height: 16),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: InputTextField(
                                    controller: model.contentTextController,
                                    hintText: 'Напишите эссе',
                                    height: 440,
                                    maxLines: 22,
                                    contentPadding: const EdgeInsets.all(8),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                PurpleButtonWidget(
                                  onPressed: onPressed,
                                  isProgress: model.isSaveProgress,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        context.select((EssayCreationModel vm) => vm.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();
    return Column(
      children: [
        Text(
          errorMessage,
          style: TextStyles.errorTextStyle,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
