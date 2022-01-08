import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/Theme/button_styles.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/app_logo_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_web_form_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:provider/provider.dart';

class RegistrationWebWidget extends StatelessWidget {
  const RegistrationWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecorations.darkScaffoldGradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                height: 696,
                child: DecoratedBox(
                  decoration: BoxDecorations.webFormBackground,
                  child: ListView(
                    children: [
                      const _AuthRegistrationRow(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 16),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            AppLogoWidget(),
                            SizedBox(height: 16),
                            WebRegistrationFormWidget(),
                            //SizedBox(height: 16),
                            //_EnterRow(),
                            //SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
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

// class _EnterRow extends StatelessWidget {
//   const _EnterRow({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final model = context.read<RegistrationModel>();
//     return SizedBox(
//       height: 20,
//       child: TextButton(
//         onPressed: () => model.openAuthWidget(context),
//         child: const Text(
//           'Войти',
//           style: TextStyles.bodyWhite,
//         ),
//         style: ButtonStyles.textButton,
//       ),
//     );
//   }
// }

class _AuthRegistrationRow extends StatelessWidget {
  const _AuthRegistrationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Container(
      color: Colors.purple,
      height: 1,
    );

    return Container(
      child: Column(
        children: [
          Row(
            children: const [_WebRegistrationRow(), _WebAuthRow()],
          ),
          divider,
        ],
      ),
    );
  }
}

class _WebRegistrationRow extends StatelessWidget {
  const _WebRegistrationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return SizedBox(
      height: 48,
      width: 180,
      child: TextButton(
        onPressed: () => model.openAuthWidget(context),
        child: const Text(
          'ВХОД',
          style: TextStyles.bodyWhite,
        ),
        style: ButtonStyles.webLeftPurpleOutlinedButton,
      ),
    );
  }
}

class _WebAuthRow extends StatelessWidget {
  const _WebAuthRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegistrationModel>();
    return SizedBox(
      height: 48,
      width: 180,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'РЕГИСТРАЦИЯ',
          style: TextStyles.bodyPurple,
        ),
        style: ButtonStyles.webRightWhiteOutlinedButton,
      ),
    );
  }
}
