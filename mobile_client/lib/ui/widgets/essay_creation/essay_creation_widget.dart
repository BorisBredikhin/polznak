import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_model.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/save_button_widget.dart';
//TODO Доработать верстку виджета

class EssayCreationWidget extends StatelessWidget {
  const EssayCreationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<EssayCreationModel>(context);
    final onPressed =
        model?.canStartSave == true ? () => model?.savePost(context) : null;
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
                const SizedBox(height: 15),
                const Text(
                  'Эссе',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const _ErrorMessageWidget(),
                const SizedBox(height: 20),
                InputTextField(
                  controller: model?.titleTextController,
                  hintText: 'Введите заголовок',
                ),
                const SizedBox(height: 20),
                InputTextField(
                  controller: model?.contentTextController,
                  hintText: 'Напишите эссе',
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                ),
                const SizedBox(height: 20),
                SaveButtonWidget(
                  onPressed: onPressed,
                  isProgress: model!.isSaveProgress,
                ),
              ],
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
    final errorMessage =
        NotifierProvider.watch<EssayCreationModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Column(
      children: [
        Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
