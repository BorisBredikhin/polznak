import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';

class WhiteButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final bool isProgress;
  const WhiteButtonWidget({
    Key? key,
    required this.onPressed,
    required this.isProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = isProgress == true
        ? const SizedBox(
            height: 10,
            width: 10,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text(
          'СОХРАНИТЬ',
          style: TextStyles.blackButtonText,
        );
    return SizedBox(
      width: 264,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
        ),
      ),
    );
  }
}
