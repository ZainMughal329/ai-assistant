import 'package:ai_assistant/helper/api.dart';
import 'package:ai_assistant/helper/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textCont = TextEditingController();
  final scrollCont = ScrollController();
  final list = <message>[
    message(msg: "Hi! How can I help you?", msgType: MessageType.bot),
  ].obs;

  Future<void> askQuestion() async {
    scrollDown();
    if (textCont.text.trim().isNotEmpty) {
      list.add(message(
          msg: textCont.text.trim().toString(), msgType: MessageType.user));
      textCont.clear();
      list.add(message(msg: "", msgType: MessageType.bot));
      scrollDown();
      try {

        await APIs().getAnswer(textCont.text.trim().toString()).then((value) {
          // print("response is" + value.toString());
          list.removeLast();

          list.add(message(msg: value, msgType: MessageType.bot));
          scrollDown();
        }).onError((error, stackTrace) {
          Get.snackbar("Error in askQuestion", error.toString());
        });
      } catch (e) {
        Get.snackbar("Error in askQuestion", e.toString());
      }

      //  String res = await APIs().getAnswer(textCont.text.trim().toString());
      //  print("response is"+res.toString());
      //   list.removeLast();
      //  list.add(message(msg: res, msgType: MessageType.bot));
    } else {
      Get.snackbar("Message", "How can I help?");
    }
  }

  void scrollDown(){
    scrollCont.animateTo(scrollCont.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

}
