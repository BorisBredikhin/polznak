import 'package:flutter/material.dart';
import 'package:mobile_client/Library/Widgets/Inherited/provider.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/auth/auth_widget.dart';
import 'package:mobile_client/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:mobile_client/ui/widgets/registration/registration_widget.dart';

class MainNavigationRouteNames {
  static const auth = 'auth';
  static const registration = 'registration';
  static const mainScreen = '/';
  //TODO Поработать с путем к редактированию профиля
  static const profileRedaction = 'profileRedaction';
}

class MainNavigation {
  // String initialRoute(bool isAuth) => MainNavigationRouteNames.profileRedaction;
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
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
        // TODO Качественно переделать все, что ниже
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget(),
    MainNavigationRouteNames.profileRedaction: (context) => const ProfileRedactionWidget(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: посмотреть видео с onGenerateRoute у lazyload (видео было пропущено в практике todo_list). В случае с переходом с виджета авторизации на виджет регистрации добавить возвращение на виджет авторизации (в зеркальной ситуации наоборот)
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