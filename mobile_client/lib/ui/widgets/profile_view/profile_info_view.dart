import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileInfoView extends StatelessWidget {
  const ProfileInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(22, 1, 255, 0.3),
            Color.fromRGBO(255, 0, 214, 0.05),
          ],
          begin: Alignment(-0.8, -1),
          end: Alignment(1, 1),
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 8),
              _ProfileAvatar(),
              SizedBox(height: 40),
              _UserNameTextField(
                text: 'Имя пользователя',
                maxLines: 1,
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: _UserDescribtionTextField(
                  maxLines: 5,
                  text:
                      'О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе О себе ',
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return Stack(
      fit: StackFit.loose,
      children: [
        Row(
          children: const [
            SizedBox(
              width: 94,
            ),
            SizedBox(height: 130, width: 130, child: Placeholder()),
          ],
        ),
        Positioned(
          right: -10,
          top: -15,
          child: IconButton(
            iconSize: 24,
            padding: EdgeInsets.zero,
            onPressed: () => model.redactionOnPressed(context),
            icon: const Icon(Icons.mode_sharp),
          ),
        ),
      ],
    );
  }
}

class _UserDescribtionTextField extends StatelessWidget {
  final int? maxLines;
  final TextStyle? textStyle;
  final String text;

  const _UserDescribtionTextField({
    Key? key,
    this.maxLines = 1,
    this.textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
              Color.fromRGBO(135, 105, 233, 1),
              Color.fromRGBO(147, 72, 205, 1),
            ],
            begin: Alignment(-0.8, -1),
            end: Alignment(1, 1),
          )),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              height: 100,
              child: RichText(
                maxLines: maxLines,
                text: TextSpan(text: text, style: textStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserNameTextField extends StatelessWidget {
  final int? maxLines;
  final TextStyle? textStyle;
  final String text;

  const _UserNameTextField({
    Key? key,
    this.maxLines = 1,
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
                  Color.fromRGBO(135, 105, 233, 1),
                  Color.fromRGBO(147, 72, 205, 1),
                ],
                begin: Alignment(-0.8, -1),
                end: Alignment(1, 1),
              )),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  maxLines: maxLines,
                  text: TextSpan(text: text, style: textStyle),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
