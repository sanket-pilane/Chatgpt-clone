import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/features/chat/model/chat_message_model.dart';
import 'package:mobile/features/chat/repo/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatNewPromtEvent>(chatNewPromtEvent);
    on<ChatNewContentGeneratedEvent>(chatNewContentGeneratedEvent);
  }

  List<ChatMessageModel> cachedMessage = [];
  StreamSubscription<http.Response>? _subscription;

  FutureOr<void> chatNewPromtEvent(
      ChatNewPromtEvent event, Emitter<ChatState> emit) {
    emit(NewChatGeneratingState());

    try {
      ChatMessageModel newMessage =
          ChatMessageModel(role: "user", content: event.prompt);
      cachedMessage.add(newMessage);
      emit(NewMessageGeneratedState());
      cachedMessage.add(ChatMessageModel(role: "assistant", content: ""));
      _subscription?.cancel();
      _subscription = getChatGptResponseRepo(cachedMessage).listen((res) {
        for (String s in res.body.split("/n")) {
          String jsonDataString = s.replaceFirst("data: ", "");
          Map<String, dynamic> data = jsonDecode(jsonDataString);
          log(data.toString());

          add(ChatNewContentGeneratedEvent(content: data['data']));
        }
      });
    } catch (e) {
      log(e.toString());
      emit(NewChatGeneratingErrorState());
    }
  }

  FutureOr<void> chatNewContentGeneratedEvent(
      ChatNewContentGeneratedEvent event, Emitter<ChatState> emit) {
    ChatMessageModel msgModel = cachedMessage.last;

    String content = event.content;

    cachedMessage.last = ChatMessageModel(
        role: "assistant", content: msgModel.content + content);
    log(cachedMessage.last.content);
    emit(NewMessageGeneratedState());
  }
}
