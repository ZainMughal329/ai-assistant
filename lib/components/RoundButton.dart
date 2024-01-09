import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundButton extends StatelessWidget {

  String name;
  VoidCallback onPressed;
   RoundButton({Key? key,required this.name,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          height: mq.height*0.06,
          width: mq.width*0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20),),
            color: Colors.blueAccent
          ),
          child: Center(child: Text(name,style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.white,
            fontSize: 20
          ),),
          ),
        ),
      ),
    );
  }
}
