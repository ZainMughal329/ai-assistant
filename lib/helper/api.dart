import 'dart:convert';
import 'dart:io';

import 'package:ai_assistant/helper/global.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class APIs {
  Future<String> getAnswer(String question) async {
    try{
      final response = await post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $apiKey"
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": question}
          ],
        },),
      );
      final answer = jsonDecode(response.body);
      // print(answer["choices"][0]["message"]["content"]);
      // print(response.body);
      return answer["choices"][0]["message"]["content"];
    }catch(e){
      Get.snackbar("Error", e.toString());
      return '';
    }
  }
}
