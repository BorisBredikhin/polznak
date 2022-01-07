import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_model.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_widget.dart';
import 'package:mobile_client/ui/widgets/screen_factory/screen_factory.dart';
import 'package:provider/provider.dart';

class Screens {
  static const auth = 'auth';
  static const registration = 'registration';
  static const mainTabs = '/';
  static const profileRedaction = '/profileRedaction';
  static const personalMessages = '/personalMessages';
}

class MainNavigation {
  final _screenFactory = ScreenFactory();

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.mainTabs: (_) => _screenFactory.makeMainTabs(),
        Screens.auth: (_) => _screenFactory.makeAuth(),
        Screens.registration: (_) => _screenFactory.makeRegistration(),
        Screens.profileRedaction: (_) => _screenFactory.makeProfileRedaction(),
        // Screens.personalMessages: (_) => _screenFactory.makePersonalMessages(),
      };
      
  String initialRoute(bool isAuth) =>
      isAuth ? Screens.mainTabs : Screens.auth;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: посмотреть видео с onGenerateRoute у lazyload (видео было пропущено в практике todo_list). В случае с переходом с виджета авторизации на виджет регистрации добавить возвращение на виджет авторизации (в зеркальной ситуации наоборот)
      // case MainNavigationRouteNames.movieDetails:
      //   final arguments = settings.arguments;
      //   final movieId = arguments is int ? arguments : 0;
      //   return MaterialPageRoute(
      //     builder: (context) => MovieDetailsWidget(movieId: movieId),
      //   );
      case Screens.personalMessages:
        final arguments = settings.arguments;
        final conversationId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => PersonalMessagesModel(conversationId),
            child: const PersonalMessagesWidget(),
          ),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
