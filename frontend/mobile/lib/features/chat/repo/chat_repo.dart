import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/features/chat/model/chat_message_model.dart';

Stream<http.Response> getChatGptResponseRepo(
    List<ChatMessageModel> message) async* {
  List<Map> mappedList = [];

  for (int i = 0; i < message.length; i++) {
    mappedList.add(message[i].toMap());
  }

  http.Request req = http.Request(
      "POST", Uri.parse("http://10.0.2.2:5157/api/generate_response"));

  req.headers['Accept'] = "text/event-stream";
  req.headers['Cache-control'] = "no-cache";
  req.headers['Content-Type'] = "application/json";
  req.body = jsonEncode({"messages": mappedList});

  final response = await http.Client().send(req);

  Stream<http.Response> mappedStream =
      response.stream.transform(utf8.decoder).map((jsonData) {
    return http.Response(jsonData, response.statusCode,
        headers: response.headers);
  });

  yield* mappedStream;
}
