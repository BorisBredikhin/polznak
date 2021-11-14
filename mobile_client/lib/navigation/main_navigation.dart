import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/auth/auth_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:mobile_client/ui/widgets/registration/registration_widget.dart';

class MainNavigationRouteNames {
  static const auth = 'auth';
  static const registration = 'registration';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      //TODO: перейти на главный экран, заменив первый route auth
      ? MainNavigationRouteNames.auth
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => NotifierProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNames.registration: (context) => NotifierProvider(
          model: RegistrationModel(),
          child: const RegistrationWidget(),
        ),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: посмотреть видео с onGenerateRoute у lazyload (видео было пропущено в практике todo_list)
      // case MainNavigationRouteNames.movieDetails:
      //   final arguments = settings.arguments;
      //   final movieId = arguments is int ? arguments : 0;
      //   return MaterialPageRoute(
      //     builder: (context) => MovieDetailsWidget(movieId: movieId),
      //   );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
