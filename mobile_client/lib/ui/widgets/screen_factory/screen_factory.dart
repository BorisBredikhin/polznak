import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_client/ui/widgets/auth/auth_model.dart';
import 'package:mobile_client/ui/widgets/auth/auth_web_widget.dart';
import 'package:mobile_client/ui/widgets/auth/auth_widget.dart';
import 'package:mobile_client/ui/widgets/chats/chats_model.dart';
import 'package:mobile_client/ui/widgets/chats/chats_web_widget.dart';
import 'package:mobile_client/ui/widgets/chats/chats_widget.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_model.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_web_widget.dart';
import 'package:mobile_client/ui/widgets/essay_creation/essay_creation_widget.dart';
import 'package:mobile_client/ui/widgets/feed/feed_model.dart';
import 'package:mobile_client/ui/widgets/feed/feed_web_widget.dart';
import 'package:mobile_client/ui/widgets/feed/feed_widget.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_view_model.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_web_widget.dart';
import 'package:mobile_client/ui/widgets/main_tabs/main_tabs_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_model.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_web_widget.dart';
import 'package:mobile_client/ui/widgets/profile_redaction/profile_redaction_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_model.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_web_widget.dart';
import 'package:mobile_client/ui/widgets/profile_view/profile_view_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_model.dart';
import 'package:mobile_client/ui/widgets/registration/registration_web_widget.dart';
import 'package:mobile_client/ui/widgets/registration/registration_widget.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainTabs() => ChangeNotifierProvider(
        create: (_) => MainTabsViewModel(),
        child: kIsWeb ? const MainTabsWebWidget() : const MainTabsWidget(),
      );

  Widget makeAuth() => ChangeNotifierProvider(
        create: (_) => AuthModel(),
        child: kIsWeb ? const AuthWebWidget() : const AuthWidget(),
      );

  Widget makeRegistration() => ChangeNotifierProvider(
        create: (_) => RegistrationModel(),
        child: kIsWeb ? const RegistrationWebWidget() : const RegistrationWidget(),
      );

  Widget makeFeed() => ChangeNotifierProvider(
        create: (_) => FeedModel(),
        child: kIsWeb ? const FeedWebWidget() : const FeedWidget(),
      );

  Widget makeEssayCreation() => ChangeNotifierProvider(
        create: (_) => EssayCreationModel(),
        child: kIsWeb ? const EssayCreationWebWidget() : const EssayCreationWidget(),
      );

  Widget makeProfileView() => ChangeNotifierProvider(
        create: (_) => ProfileViewModel(),
        child: kIsWeb ? const ProfileViewWebWidget() : const ProfileViewWidget(),
      );

  Widget makeProfileRedaction() => ChangeNotifierProvider(
        create: (_) => ProfileRedactionModel(),
        child: kIsWeb ? const ProfileRedactionWebWidget() : const ProfileRedactionWidget(),
      );

  Widget makeChats() => ChangeNotifierProvider(
        create: (_) => ChatsModel(),
        child: kIsWeb ? const ChatsWebWidget() : const ChatsWidget(),
      );
}
