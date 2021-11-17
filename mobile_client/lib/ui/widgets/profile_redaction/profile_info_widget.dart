import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final _usernameTextController = TextEditingController();
  final _userDescribtionTextController = TextEditingController();

  void _save() {
    final username = _usernameTextController.text;
    final userDescibtion = _userDescribtionTextController.text;

    print(username);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(22, 1, 255, 0.5),
            Color.fromRGBO(255, 0, 214, 0.0),
          ],
          begin: Alignment(-0.8, -1),
          end: Alignment(1, 1),
        )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const _ProfileAvatar(),
              const SizedBox(height: 60),
              InputTextField(
                hintText: 'Имя пользователя',
                controller: _usernameTextController,
                contentPadding: const EdgeInsets.all(10),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: InputTextField(
                  hintText: 'О себе',
                  controller: _userDescribtionTextController,
                  contentPadding: const EdgeInsets.all(10),
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 6),
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
          const SizedBox(height: 130, width: 130, child: Placeholder()),
          Positioned(
            right: -10,
            bottom: -10,
            child: IconButton(
              iconSize: 20,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo),
            ),
          ),
        ],
      ),
    );
  }
}
