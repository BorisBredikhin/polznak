// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int,
      body: json['body'] as String,
      sendAt: json['send_at'] as String,
      conversation: json['conversation'] as int,
      sender: json['sender'] as int,
      seenBy: json['seen_by'] as List<dynamic>,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'send_at': instance.sendAt,
      'conversation': instance.conversation,
      'sender': instance.sender,
      'seen_by': instance.seenBy,
    };
