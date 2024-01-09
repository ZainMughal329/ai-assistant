import 'package:ai_assistant/components/RoundButton.dart';
import 'package:ai_assistant/components/bottom_sheet.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/screens/FeaturesScreen/translator/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AiTranslatorScreen extends StatelessWidget {
  AiTranslatorScreen({Key? key}) : super(key: key);
  final contr = AITranslatorController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        title: Text("AiTranslatorScreen"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: mq.height * 0.05),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => InkWell(
                onTap: (){
                  Get.bottomSheet(LanguageBottomSheet(cont: contr, fromLang: contr.from));
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: mq.height * 0.1,
                  width: mq.width * 0.4,
                  alignment: Alignment.center,
                  child: contr.from.value== "" ? Text("Auto") : Text(contr.from.value.toString()),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.repeat,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: mq.height * 0.1,
                  width: mq.width * 0.4,
                  // width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("To"),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onTapOutside: (e) {
              FocusScope.of(context).unfocus();
            },
            minLines: 2,
            maxLines: null,
            controller: contr.textCont,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              hintText: "Type something to convert it into specified language",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          contr.resultCont.text.isNotEmpty
              ? TextFormField(
                  onTapOutside: (e) {
                    FocusScope.of(context).unfocus();
                  },
                  minLines: 2,
                  maxLines: null,
                  controller: contr.resultCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                  textAlign: TextAlign.center,
                )
              : SizedBox(),
          RoundButton(name: "Translate", onPressed: () {}),
        ],
      ),
    );
  }
}
