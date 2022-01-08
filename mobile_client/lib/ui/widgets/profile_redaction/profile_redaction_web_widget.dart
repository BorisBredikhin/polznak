import 'package:flutter/material.dart';
import 'package:mobile_client/ui/Theme/box_decorations.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_form_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_web_form_widget.dart';

class ProfileRedactionWebWidget extends StatelessWidget {
  const ProfileRedactionWebWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            _ProfileAvatar(),
                            //SizedBox(height: 32),
                            WebProfileRedactionFormWidget(),
                            SizedBox(height: 16),
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
