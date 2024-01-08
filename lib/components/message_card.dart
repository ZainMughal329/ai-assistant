import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MessageCard extends StatelessWidget {
  final message msg;
  MessageCard({Key? key,required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 2),
      child: msg.msgType == MessageType.bot ?
          // for bot
      Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Image.asset('assets/images/logo.png',width: 25,),
          ),
          SizedBox(width: 5,),
          Container(
            constraints: BoxConstraints(
              maxWidth: mq.width * 0.6,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                border: Border.all(
                    color: Colors.black
                )
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              child: msg.msg == "" ? AnimatedTextKit(
                repeatForever: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText("Please wait ...",speed: Duration(milliseconds: 100),),
                ],
                onTap: () {
                  // print("Tap Event");
                },
              ) :
              Text(msg.msg),
              // AnimatedTextKit(
              //   repeatForever: false,
              //   totalRepeatCount: 1,
              //   animatedTexts: [
              //     TypewriterAnimatedText(msg.msg,speed: Duration(milliseconds: 100),),
              //   ],
              //   onTap: () {
              //     // print("Tap Event");
              //   },
              // ),
            ),
          )
        ],
      ) :
          // for user
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: mq.width * 0.6,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                border: Border.all(
                    color: Colors.black
                )
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              child: Text(msg.msg),
            ),
          ),
          SizedBox(width: 5,),
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.person),
            // child: Image.asset('assets/images/logo.png',width: 25,),
            // child: Lottie.asset('assets/animations/translatorBot.json',width: 25),
          ),
        ],
      ),
    );
  }
}
