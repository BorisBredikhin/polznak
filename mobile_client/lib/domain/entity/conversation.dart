import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Conversation {
  final int id;
  final List<Participant> participants;
  Conversation({
    required this.id,
    required this.participants,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Participant {
  final int id;
  final User user;
  final String gender;
  final String birthDate;
  final String details;
  final List<dynamic> interests;
  final List<dynamic> knowsLanguages;
  Participant({
    required this.id,
    required this.user,
    required this.gender,
    required this.birthDate,
    required this.details,
    required this.interests,
    required this.knowsLanguages,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
