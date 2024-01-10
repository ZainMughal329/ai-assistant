import 'package:ai_assistant/components/RoundButton.dart';
import 'package:ai_assistant/components/bottom_sheet.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/screens/FeaturesScreen/image/controller.dart';
import 'package:ai_assistant/screens/FeaturesScreen/translator/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AiTranslatorScreen extends StatelessWidget {
  AiTranslatorScreen({Key? key}) : super(key: key);
  final contr = AITranslatorController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Translator"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: mq.height * 0.05,horizontal: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        LanguageBottomSheet(cont: contr, fromLang: contr.from));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: mq.height * 0.1,
                    width: mq.width * 0.4,
                    alignment: Alignment.center,
                    child: contr.from.value == ""
                        ? Text("Auto")
                        : Text(contr.from.value.toString()),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  contr.swapValues();
                },
                icon: Icon(
                  CupertinoIcons.repeat,
                  color: Colors.grey,
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    Get.bottomSheet(
                        LanguageBottomSheet(cont: contr, fromLang: contr.to));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: mq.height * 0.1,
                    width: mq.width * 0.4,
                    alignment: Alignment.center,
                    child: contr.to.value == ""
                        ? Text("To")
                        : Text(contr.to.value.toString()),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
            minLines: 3,
            maxLines: null,
            controller: contr.textCont,
            cursorColor: Theme.of(context).lightButton,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).lightButton,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                // borderSide: BorderSide(),
              ),
              hintText: "Type something to convert it into specified language",
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return contr.status.value == Status.completed
                ? TextFormField(
                    onTapOutside: (e) {
                      FocusScope.of(context).unfocus();
                    },
                    // minLines: 2,
                    // maxLines: null,
                    controller: contr.resultCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  )
                : contr.status.value == Status.loading
                    ? Lottie.asset('assets/animations/loading.json',
                        width: mq.width * 0.3, height: mq.height * 0.3)
                    : SizedBox();
          }),

          // contr.resultCont.text.isNotEmpty
          //     ? TextFormField(
          //         onTapOutside: (e) {
          //           FocusScope.of(context).unfocus();
          //         },
          //         minLines: 2,
          //         maxLines: null,
          //         controller: contr.resultCont,
          //         decoration: InputDecoration(
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(10)),
          //             borderSide: BorderSide(color: AppColors.primaryColor),
          //           ),
          //         ),
          //         textAlign: TextAlign.center,
          //       )
          //     : SizedBox(),
          RoundButton(
              name: "Translate",
              onPressed: () {
                contr.translate();
              }),
        ],
      ),
    );
  }
}
