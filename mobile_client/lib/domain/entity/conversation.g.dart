// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['id'] as int,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participants': instance.participants.map((e) => e.toJson()).toList(),
    };

Participant _$ParticipantFromJson(Map<String, dynamic> json) => Participant(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      gender: json['gender'] as String,
      birthDate: json['birth_date'] as String,
      details: json['details'] as String,
      interests: json['interests'] as List<dynamic>,
      knowsLanguages: json['knows_languages'] as List<dynamic>,
    );

Map<String, dynamic> _$ParticipantToJson(Participant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'details': instance.details,
      'interests': instance.interests,
      'knows_languages': instance.knowsLanguages,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
