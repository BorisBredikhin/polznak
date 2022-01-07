import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Message {
  final int id;
  final String body;
  final String sendAt;
  final int conversation;
  final int sender;
  final List<dynamic> seenBy;
  
  Message({
    required this.id,
    required this.body,
    required this.sendAt,
    required this.conversation,
    required this.sender,
    required this.seenBy,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}