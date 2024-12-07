/*import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:odo/helper/global.dart';

class Appwrite{
  static final   _client = Client();
  static final   _database =Databases(_client);
  static void init() {

   _client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('673d418200226999dfe3')
      .setSelfSigned(
      status:true);
   getApiKey();

  }

  static Future<String> getApiKey() async{
    try{
      final d = await _database.getDocument(
          databaseId: '673d5158001fef28dd3e',
          collectionId: 'ApiKey',
          documentId: 'GeminiApiKey');
      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    }
    catch(e){
      log('$e');
      return '';
    }

  }*/
//}