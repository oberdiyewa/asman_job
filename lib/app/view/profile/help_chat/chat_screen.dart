import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/profile/fill_about_yourself/add_experience/add_experience.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/model/chat_message_model.dart';
import '../../helpers.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Salam. Tehniki komek ucin yazyn",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Salam. Tehniki komek ucin yazyn",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Bildirish goshup bilemok?", messageType: "sender"),
    ChatMessage(
        messageContent: "Tiz wagtda duzederis.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Bildirish goshup bilemok?", messageType: "sender"),
  ];
  String? newMessage;
  ScrollController _scrollController = ScrollController();
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: const BaseAppbar(title: 'Tehniki kömek'),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            controller: _scrollController,
            padding: EdgeInsets.only(top: 10, bottom: 89),
            itemBuilder: (context, index) {
              final isReceiver = messages[index].messageType == 'receiver';
              return Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 10, bottom: 10),
                child: Align(
                  alignment:
                      isReceiver ? Alignment.topLeft : Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: isReceiver
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      if (isReceiver)
                        CircleAvatar(
                          // backgroundImage: AssetImage(Assets.logoAvatar),
                          radius: 20,
                          backgroundColor: kcPrimaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(Assets.logoAvatar),
                          ),
                        )
                      else
                        const SizedBox(),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isReceiver
                              ? kcPrimaryColor.withOpacity(0.2)
                              : const Color.fromRGBO(217, 217, 217, 1),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 11),
                        child: Expanded(
                          child: Text(
                            messages[index].messageContent,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      if (isReceiver)
                        const SizedBox()
                      else
                        const CircleAvatar(
                          backgroundImage: AssetImage(Assets.avatar),
                          radius: 20,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 2, top: 2),
              height: 79.h,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: 3,
                      minLines: 1,
                      controller: _textController,
                      onChanged: (value) {
                        newMessage = value;
                      },
                      onSubmitted: (value) {
                        newMessage = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: kcLightGreyColor),
                        ),

                        suffixIcon: Container(
                          width: 55,
                          height: 34,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: FittedBox(
                            child: FloatingActionButton.extended(
                              label: SvgPicture.asset(Assets.sendIcon),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () {
                                messages.add(
                                  ChatMessage(
                                    messageContent: newMessage!,
                                    messageType: 'sender',
                                  ),
                                );
                                _textController.clear();
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent *
                                      2,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.fastOutSlowIn,
                                );
                                setState(() {});
                              },
                              backgroundColor: kcPrimaryColor.withOpacity(0.5),
                              elevation: 0,
                              // child: const Icon(
                              //   Icons.send,
                              //   color: Colors.white,
                              //   size: 18,
                              // ),
                            ),
                          ),
                        ),
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
