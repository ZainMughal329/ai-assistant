import 'package:ai_assistant/components/message_card.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/screens/FeaturesScreen/chat/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AiChatScreen extends StatelessWidget {
  AiChatScreen({Key? key}) : super(key: key);
  final contr = Get.put<ChatController>(ChatController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Ai ChatBot (GPT 3.5)"),
        elevation: 1,
      ),
      body: Obx(() => Padding(
        padding: EdgeInsets.only(bottom: mq.width * 0.25),
        child: ListView(
          physics: BouncingScrollPhysics(),
          controller: contr.scrollCont,
          children: contr.list.map((element) => MessageCard(msg: element)).toList(),
        ),
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: [
            // this expanded is necessary as it allows to cover max available space
            Expanded(
              child: TextFormField(
                onTapOutside: (e) {
                  FocusScope.of(context).unfocus();
                },
                cursorColor: Theme.of(context).lightButton,
                controller: contr.textCont,
                decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Theme.of(context).lightButton),
                  ),
                  isDense: true,
                  focusColor: Theme.of(context).scaffoldBackgroundColor,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  hintText: "Ask me anything ...",
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).lightButton,
              child: IconButton(
                  onPressed: () {
                    contr.askQuestion();
                  },
                  icon: Icon(
                    Icons.rocket_launch_outlined,
                    // color: Colors.white,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
