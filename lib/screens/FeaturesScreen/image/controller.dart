import 'dart:io';

import 'package:ai_assistant/helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

// this enum is for loading status
enum Status { none, loading, completed }

class AIImageController extends GetxController {
  final textContr = TextEditingController();
  final url = ''.obs;

  final loadingStatus = Status.none.obs;

  Future<void> generateAiImage() async {
    try {
      // this is the api Key of ChatGPT used for dart_openAi pakage
      OpenAI.apiKey = apiKey;
      if (textContr.text.trim().isNotEmpty) {
        loadingStatus.value = Status.loading;
        OpenAIImageModel image = await OpenAI.instance.image.create(
          prompt: textContr.text.trim().toString(),
          n: 1,
          size: OpenAIImageSize.size256,
          responseFormat: OpenAIImageResponseFormat.url,
        );
        url.value = image.data[0].url.toString();
        loadingStatus.value = Status.completed;
      } else {
        Get.snackbar("Error", "Write some details");
      }
    } catch (e) {
      Get.snackbar("Error while generating Image", e.toString());
      loadingStatus.value = Status.completed;
    }
  }

  void saveNetworkImage() async {
    showLoadingDialoge();
    try {
      //getting the body of Image in bytes
      // final bytes = (await get(Uri.parse(url))).bodyBytes;
      // // getting the path of temp directory of the application
      // final dir = await getTemporaryDirectory();
      // // this will get the path of imageFile obtained from bytes
      // final file = await File(dir.path + "/ai_image").writeAsBytes(bytes);
      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      // log('filePath: ${file.path}');
      //save image to gallery
      await GallerySaver.saveImage(file.path, albumName: appName)
          .then((success) {
        //hide loading
        Get.back();
        Get.snackbar("Downloaded", "Image Saved Successfully");
      });
    } catch (e) {
      Get.back();
      Get.snackbar("Error", e.toString());
    }
  }

  void shareNetworkImage() async {
    showLoadingDialoge();
    try {
      // //getting the body of Image in bytes
      // final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      // // getting the path of temp directory of the application
      // final dir = await getTemporaryDirectory();
      // // this will get the path of imageFile obtained from bytes
      // final file = await File(dir.path).writeAsBytes(bytes);
      //
      // // saving the image into gallery form the path(holding downloaded image) of temp directory,
      // Get.back();
      // await Share.shareXFiles([XFile(file.path)], text: 'Look what AI Assistant created').then((value){
      //
      //   Get.snackbar("Shared", "Sucessfully");
      // });

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      // log('filePath: ${file.path}');

      //hide loading
      Get.back();

      await Share.shareXFiles([XFile(file.path)],
          text:
          'Check out this Amazing Image created by Ai Assistant App by M.Zain');

    } catch (e) {
      Get.back();
      Get.snackbar("Error", e.toString());
    }
  }

  void showLoadingDialoge() {
    Get.dialog(Center(child: Lottie.asset('assets/animations/loading.json')));
  }
}
