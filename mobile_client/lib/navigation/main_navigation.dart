import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/interlocutor_profile_view/interlocutor_profile_view_web_widget.dart';
import 'package:mobile_client/ui/widgets/interlocutor_profile_view/interlocutor_profile_view_widget.dart';
import 'package:mobile_client/ui/widgets/interlocutor_profile_view/interlocutor_profile_view_model.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_model.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_web_widget.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_widget.dart';
import 'package:mobile_client/ui/widgets/screen_factory/screen_factory.dart';
import 'package:provider/provider.dart';

class Screens {
  static const auth = 'auth';
  static const registration = 'registration';
  static const mainTabs = '/';
  static const feed = '/feed';
  static const essayCreation = '/essayCreation';
  static const profileRedaction = '/profileRedaction';
  static const personalMessages = '/personalMessages';
  static const interlocutorProfile = '/interlocutorProfile';
  static const chats = 'chats';
  static const profileView = 'profileView';

}

class MainNavigation {
  final _screenFactory = ScreenFactory();

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.mainTabs: (_) => _screenFactory.makeMainTabs(),
        Screens.auth: (_) => _screenFactory.makeAuth(),
        Screens.registration: (_) => _screenFactory.makeRegistration(),
        Screens.profileRedaction: (_) => _screenFactory.makeProfileRedaction(),
        Screens.feed: (_) => _screenFactory.makeFeed(),
        Screens.essayCreation: (_) => _screenFactory.makeEssayCreation(),
        Screens.chats: (_) => _screenFactory.makeChats(),
        Screens.profileView: (_) => _screenFactory.makeProfileView(),
      };
      
  String initialRoute(bool isAuth) =>
      isAuth ? Screens.mainTabs : Screens.auth;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //TODO: ???????????????????? ?????????? ?? onGenerateRoute ?? lazyload (?????????? ???????? ?????????????????? ?? ???????????????? todo_list). ?? ???????????? ?? ?????????????????? ?? ?????????????? ?????????????????????? ???? ???????????? ?????????????????????? ???????????????? ?????????????????????? ???? ???????????? ?????????????????????? (?? ???????????????????? ???????????????? ????????????????)
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
            child: kIsWeb ? const PersonalMessagesWebWidget() : const PersonalMessagesWidget(),
          ),
        );
      case Screens.interlocutorProfile:
      final arguments = settings.arguments;
        final userId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => InterlocutorProfileViewModel(userId),
            child: kIsWeb ? const InterlocutorProfileViewWebWidget() : const InterlocutorProfileViewWidget(),
          ),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
