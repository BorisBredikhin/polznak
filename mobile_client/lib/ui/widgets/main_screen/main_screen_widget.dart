import 'package:flutter/material.dart';
import 'package:mobile_client/domain/data_providers/token_data_provider.dart';
import 'package:mobile_client/navigation/main_navigation.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    exitOnPressed() {
      TokenDataProvider().setToken(null);
      Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.auth);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Выйти'),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: exitOnPressed,
            ),
            const SizedBox(height: 30),
            const Text('Добавить эссе'),
            IconButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(MainNavigationRouteNames.essayCreation),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
