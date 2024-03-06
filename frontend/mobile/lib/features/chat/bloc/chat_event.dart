// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

sealed class ChatEvent {}

class ChatNewPromtEvent extends ChatEvent {
  final String prompt;
  ChatNewPromtEvent({
    required this.prompt,
  });
}

class ChatNewContentGeneratedEvent extends ChatEvent {
  String content;
  ChatNewContentGeneratedEvent({
    required this.content,
  });
}
