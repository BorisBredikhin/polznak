import 'package:flutter/material.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Выйти'),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => TokenDataProvider().setToken(null),
            ),
          ],
        ),
      ),
    );
  }
}
