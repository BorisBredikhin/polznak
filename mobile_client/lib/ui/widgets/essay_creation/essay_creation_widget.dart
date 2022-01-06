import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/white_button_widget.dart';
import 'package:provider/provider.dart';
//TODO Доработать верстку виджета

class EssayCreationWidget extends StatelessWidget {
  const EssayCreationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EssayCreationModel>();
    final onPressed =
        model.canStartSave == true ? () => model.savePost(context) : null;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Эссе',
          style: TextStyles.headline6White,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(
            color: Color.fromRGBO(20, 0, 255, 0.26),
            height: 0,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecorations.scaffoldGradient,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                      ),
                    ),
                    const SizedBox(height: 24),
                    WhiteButtonWidget(
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
