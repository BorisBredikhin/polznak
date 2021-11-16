import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_essay_redaction_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_info_widget.dart';

class ProfileRedactionWidget extends StatelessWidget {
  const ProfileRedactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(0, 22, 217, 0.38),
              Color.fromRGBO(188, 0, 169, 1),
            ],
            begin: Alignment(-0.8, -1),
            end: Alignment(1, 1),
          ),
        ),
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
                        ProfileInfo(),
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
                              SizedBox(height: 220, child: Essays()),
                              saveButton(),
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

SizedBox saveButton() {
  return SizedBox(
    width: 100,
    height: 30,
    child: OutlinedButton(
      onPressed: () {},
      child: Row(
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
      ),
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(const Color.fromRGBO(196, 1962, 196, 1)),
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
