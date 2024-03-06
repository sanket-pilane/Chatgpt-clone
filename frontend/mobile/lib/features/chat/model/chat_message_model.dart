import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatMessageModel {
  final String role;
  final String content;
  ChatMessageModel({
    required this.role,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'content': content,
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      role: map['role'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) =>
      ChatMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
