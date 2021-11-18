import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_essay_redaction_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_info_widget.dart';

class ProfileRedactionWidget extends StatelessWidget {
  const ProfileRedactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.backgroundGradient,
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ProfileInfo(),
                        Divider(),
                        const SizedBox(height: 6),
                        const Text(
                          'Мои эссе',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 280,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 220, child: Essays()),
                              //TODO Обработка нажатия
                              // SaveButtonWidget(onPressed: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  final _divider = Container(
    color: const Color.fromRGBO(22, 1, 255, 0.5),
    height: 1,
  );

  Divider({
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
