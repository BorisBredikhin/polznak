import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/auth/auth_widget.dart';
import 'package:mobile_client/ui/widgets/chats/chats_model.dart';
import 'package:mobile_client/ui/widgets/chats/chats_widget.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_model.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_widget.dart';
import 'package:mobile_client/ui/widgets/feed/feed_model.dart';
import 'package:mobile_client/ui/widgets/feed/feed_widget.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_view_model.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_widget.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_model.dart';
import 'package:mobile_client/ui/widgets/personal_messages/personal_messages_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_model.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_model.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:mobile_client/ui/widgets/registration/registration_widget.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainTabs() => ChangeNotifierProvider(
        create: (_) => MainTabsViewModel(),
        child: const MainTabsWidget(),
      );

  Widget makeAuth() => ChangeNotifierProvider(
        create: (_) => AuthModel(),
        child: const AuthWidget(),
      );

  Widget makeRegistration() => ChangeNotifierProvider(
        create: (_) => RegistrationModel(),
        child: const RegistrationWidget(),
      );

  Widget makeFeed() => ChangeNotifierProvider(
        create: (_) => FeedModel(),
        child: const FeedWidget(),
      );

  Widget makeEssayCreation() => ChangeNotifierProvider(
        create: (_) => EssayCreationModel(),
        child: const EssayCreationWidget(),
      );

  Widget makeProfileView() => ChangeNotifierProvider(
        create: (_) => ProfileViewModel(),
        child: const ProfileViewWidget(),
      );

  Widget makeProfileRedaction() => ChangeNotifierProvider(
        create: (_) => ProfileRedactionModel(),
        child: const ProfileRedactionWidget(),
      );

  Widget makeChats() => ChangeNotifierProvider(
        create: (_) => ChatsModel(),
        child: const ChatsWidget(),
      );

  // Widget makePersonalMessages() => ChangeNotifierProvider(
  //       create: (_) => PersonalMessagesModel(),
  //       child: const PersonalMessagesWidget(),
  //     );
}
