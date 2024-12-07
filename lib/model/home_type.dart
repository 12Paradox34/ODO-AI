import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:odo/screen/feature/chatbot_feature.dart';
import 'package:odo/screen/feature/image_feature.dart';
import 'package:odo/screen/feature/translator_feature.dart';

enum HomeType{
  aiChatBot, aiImage, aiTranslator
}

extension MyHometype on HomeType{
  String get title =>    switch(this){


    HomeType.aiChatBot => 'AI ChatBot',

    HomeType.aiImage => 'AI ImageGenerator',

    HomeType.aiTranslator => 'Language Translator',
  };
// for lottie
  String get lottie =>    switch(this){


    HomeType.aiChatBot => 'ai_hand_waving.json',

    HomeType.aiImage => 'ai_play.json',

    HomeType.aiTranslator => 'ai_ask_me.json',
  };
// for alignment
  bool get leftAlign => switch(this) {

    HomeType.aiChatBot => true,

    HomeType.aiImage => false,

    HomeType.aiTranslator => true,
  };
// for padding
  EdgeInsets get padding => switch(this) {

    HomeType.aiChatBot => EdgeInsets.zero,

    HomeType.aiImage => const EdgeInsets.all(20),

    HomeType.aiTranslator => EdgeInsets.zero,
  };
  // for Navigation
  VoidCallback get onTap => switch(this) {

    HomeType.aiChatBot => () => Get.to(() => const ChatbotFeature()),

    HomeType.aiImage => () => Get.to(() => const ImageFeature()),

    HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
  };
}