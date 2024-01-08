import 'package:ai_assistant/screens/FeaturesScreen/chat/ai_chat.dart';
// import 'package:ai_assistant/screens/FeaturesScreen/ai_image.dart';
import 'package:ai_assistant/screens/FeaturesScreen/ai_translator.dart';
import 'package:ai_assistant/screens/FeaturesScreen/image/ai_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType {aiChatbot,aiImage,aiTranslator}

extension MyHomeType on HomeType {

  String get title => switch (this){

    // TODO: Handle this case.
    HomeType.aiChatbot => 'AI Chat-Bot',
    // TODO: Handle this case.
    HomeType.aiImage => 'AI Image Creator',
    // TODO: Handle this case.
    HomeType.aiTranslator => 'AI Translator',
  };


  String get lottie => switch (this){

  // TODO: Handle this case.
    HomeType.aiChatbot => 'translatorBot.json',
  // TODO: Handle this case.
    HomeType.aiImage => 'image_ai.json',
  // TODO: Handle this case.
    HomeType.aiTranslator => 'onboarding1.json',
  };


  bool get allignLeft => switch (this){

  // TODO: Handle this case.
    HomeType.aiChatbot => true,
  // TODO: Handle this case.
    HomeType.aiImage => false,
  // TODO: Handle this case.
    HomeType.aiTranslator => true,
  };

  VoidCallback get onTap => switch (this){

  // TODO: Handle this case.
    HomeType.aiChatbot => () => Get.to(()=>AiChatScreen()),
  // TODO: Handle this case.
    HomeType.aiImage => () => Get.to(()=>AIImageScreen()),
  // TODO: Handle this case.
    HomeType.aiTranslator => () => Get.to(()=>AiTranslatorScreen()),
  };


}