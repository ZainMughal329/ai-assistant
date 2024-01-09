import 'dart:convert';
import 'dart:developer';

import 'package:ai_assistant/components/list_of_languages.dart';
import 'package:ai_assistant/helper/api.dart';
import 'package:ai_assistant/screens/FeaturesScreen/image/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AITranslatorController extends GetxController {
  final textCont = TextEditingController();
  final resultCont = TextEditingController();
  final searchCont = TextEditingController();

  final from = "".obs, to = "".obs;
  // llang is the list of all languages
  final lang = llang;
  final status = Status.none.obs;

  Future<void> translate() async {
    status.value = Status.loading;
    if (textCont.text.isNotEmpty && to.value.isNotEmpty) {
      String prompt = "";

      if (from.value == "") {
        prompt =
            "Translate the give below text into ${to.value} language \n \'${textCont.text.trim().toString().toLowerCase()}\'  ";
      } else {
        prompt =
            "Translate the give below text from ${from.value} language into ${to.value} language \n \'${textCont.text.trim().toString().toLowerCase()}\'";
      }
      try{
        await APIs().getAnswer(prompt).then((value){
          // the below code is to decode langugae result
          final res = utf8.decode(value.codeUnits);
          resultCont.text = res;
          // log(value);
          status.value = Status.completed;


        });
        // textCont.clear();
      }catch(e){
        Get.snackbar('Error',e.toString());
        status.value = Status.completed;
      }

    } else {

      if (textCont.text.trim().toString().isEmpty)
        Get.snackbar("Error", "Enter text to translate");
      if (to.value.isEmpty) Get.snackbar("Error", "Select language to translate");
      status.value = Status.completed;
    }
  }

  void swapValues (){
   if(to.value.isNotEmpty && from.value.isNotEmpty){
     final t = to.value;
     to.value = from.value;
     from.value = t;
     textCont.clear();
     resultCont.clear();
   }else{
     Get.snackbar("Error", "Select languages to translate");
   }
  }
}
