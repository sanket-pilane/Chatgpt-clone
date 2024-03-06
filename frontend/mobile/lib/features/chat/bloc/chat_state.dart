part of 'chat_bloc.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class NewChatGeneratingState extends ChatState {}

final class NewChatGeneratingErrorState extends ChatState {}

final class NewMessageGeneratedState extends ChatState {}
