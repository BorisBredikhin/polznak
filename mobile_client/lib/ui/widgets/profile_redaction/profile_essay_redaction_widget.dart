import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/popular_widgets/input_text_field_widget.dart';

class Essays extends StatefulWidget {
  const Essays({Key? key}) : super(key: key);

  @override
  _EssaysState createState() => _EssaysState();
}

class _EssaysState extends State<Essays> {
  final _essayTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  1, //временно, будет изменяться пользователем при редактировании профиля
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: 320,
                                child: InputTextField(
                                  controller: _essayTextController,
                                  prefixIcon: const Icon(Icons.tag),
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: 'Введите тему эссе',
                                ),
                              ),
                              Positioned(
                                right: -10,
                                top: -7,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                  splashRadius: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
