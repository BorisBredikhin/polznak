import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final bool isProgress;
  const SaveButtonWidget({
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
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Сохранить',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.save,
                size: 18,
                color: Colors.black,
              ),
            ],
          );
    return SizedBox(
      width: 100,
      height: 30,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              const Color.fromRGBO(196, 1962, 196, 1)),
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 6),
          ),
        ),
      ),
    );
  }
}
