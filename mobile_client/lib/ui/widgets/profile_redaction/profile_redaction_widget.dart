import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_form_widget.dart';

class ProfileRedactionWidget extends StatelessWidget {
  const ProfileRedactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecorations.scaffoldGradient,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  _ProfileAvatar(),
                  SizedBox(height: 32),
                  ProfileRedactionFormWidget(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatefulWidget {
  const _ProfileAvatar({Key? key}) : super(key: key);

  @override
  __ProfileAvatarState createState() => __ProfileAvatarState();
}

class __ProfileAvatarState extends State<_ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.loose,
        children: [
          CircleAvatar(
            radius: 60,
            //backgroundImage: , //TODO: должна отображаться картинка профиля
          ),
          Positioned(
            right: -0,
            bottom: -0,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: IconButton(
                iconSize: 24,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
