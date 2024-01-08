import 'package:ai_assistant/helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// this enum is for loading status
enum Status {none,loading,completed}

class AIImageController extends GetxController {

  final textContr = TextEditingController ();
  String url = '';

  final loadingStatus = Status.none.obs;


  Future<void> generateAiImage() async{

    try{
      // this is the api Key of ChatGPT used for dart_openAi pakage
      OpenAI.apiKey = apiKey;
      if(textContr.text.trim().isNotEmpty){
        loadingStatus.value = Status.loading;
        OpenAIImageModel image = await OpenAI.instance.image.create(
          prompt: textContr.text.trim().toString(),
          n: 1,
          size: OpenAIImageSize.size256,
          responseFormat: OpenAIImageResponseFormat.url,
        );
        url = image.data[0].url.toString();
        loadingStatus.value = Status.completed;

      }else{
        Get.snackbar("Error", "Write some details");
      }

    }catch(e){
      Get.snackbar("Error while generating Image", e.toString());
      loadingStatus.value = Status.completed;
    }
  }
}