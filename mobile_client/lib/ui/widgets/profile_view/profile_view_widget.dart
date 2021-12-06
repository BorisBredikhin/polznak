import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/app_colors.dart';
import 'package:mobile_client/ui/Theme/text_styles.dart';
import 'package:mobile_client/ui/widgets/profile_view/essays_list_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/view_profile_info_widget.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppColors.scaffoldGradient,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  ViewProfileInfoWidget(),
                  _Divider(),
                  SizedBox(height: 6),
                  Text(
                    'Мои эссе',
                    style: TextStyles.whiteSize16,
                  ),
                  EssaysListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _divider = Container(
      color: const Color.fromRGBO(22, 1, 255, 0.5),
      height: 1,
    );
    return Row(
      children: [
        Expanded(child: _divider),
      ],
    );
  }
}
