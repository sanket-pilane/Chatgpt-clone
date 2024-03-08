import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/my_drawer.dart';
import 'package:mobile/components/prompt_container.dart';
import 'package:mobile/design/app_color.dart';
import 'package:mobile/utils/constants.dart';

import 'bloc/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isChatStarted = false;
  ChatBloc chatBloc = ChatBloc();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChatGPT",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: chatBloc.cachedMessage.length,
                  itemBuilder: (context, index) {
                    isChatStarted = true;
                    return Container(
                      decoration: BoxDecoration(
                          color:
                              chatBloc.cachedMessage[index].role == "assistant"
                                  ? AppColor.msgBgColor
                                  : Colors.transparent),
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chatBloc.cachedMessage[index].role == "assistant"
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: SizedBox(
                                    child: SvgPicture.asset(
                                      "assets/svg/log.svg",
                                      color: Colors.green,
                                      height: 34,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: SizedBox(
                                    child: Image.asset(
                                      "assets/images/tony.jpeg",
                                      height: 34,
                                    ),
                                  ),
                                ),
                          Expanded(
                            child: Text(
                              chatBloc.cachedMessage[index].content,
                              style: TextStyle(
                                fontSize: chatBloc.cachedMessage[index].role ==
                                        "assistant"
                                    ? 16
                                    : 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
                isChatStarted == false
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Prompts.prompts.length,
                          itemBuilder: (context, index) {
                            final prompt = Prompts.prompts[index];
                            return InkWell(
                                onTap: () {
                                  controller.text = prompt;
                                },
                                child: PromtContainer(prompt: prompt));
                          },
                        ))
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                filled: false,
                                hintText: "Ask me anything...!"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              String text = controller.text;
                              controller.clear();
                              chatBloc.add(ChatNewPromtEvent(prompt: text));
                            }

                            FocusScope.of(context).unfocus();
                          },
                          child: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        "ChatGPT March 2024",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Free research preview")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
