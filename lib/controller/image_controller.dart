import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
//import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:share_plus/share_plus.dart';

import '../apis/apis.dart';
//import '../helper/global.dart';
import '../helper/my_dialog.dart';

enum Status {none, loading, complete}


class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  //String url = '';


  final imageList = <String>[].obs;


  final url = ''.obs;


  /* Future<void> createAIImage() async {
    //OpenAI.apiKey = apiKeyO;
    if(textC.text.trim().isNotEmpty)
      {
        status.value = Status.loading;
        OpenAIImageModel image = await OpenAI.instance.image.create(
          prompt: textC.text,
          n: 1,
          size: OpenAIImageSize.size512,
          responseFormat: OpenAIImageResponseFormat.url,
        );
        // user
        url= image.data[0].url.toString();

        textC.text = '';

        status.value = Status.complete;
      }
  }*/

  Future<void> searchAiImage() async {
    //if prompt is not empty
    if (textC.text
        .trim()
        .isNotEmpty) {
      status.value = Status.loading;

      imageList.value = await APIs.searchAiImages(textC.text);

      if (imageList.isEmpty) {
        MyDialog.error('Something went wrong (Try again in sometime)');


        return;
      }

      url.value = imageList.first;

      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
      //MyDialog.info('Provide some beautiful image description!');
    }
  }


  void downloadImage() async {
    try {
      // Show loading dialog
      MyDialog.showLoadingDialog();

      //log('url: $url');

      // Fetch the image data
      //final bytes = (await get(Uri.parse(url.value))).bodyBytes;

      // Save the image to the gallery
      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      //final dir = await getTemporaryDirectory();

      //final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      final result = await SaverGallery.saveImage(
        bytes,
        fileName: 'ai_image.png', // Provide a file name
        androidRelativePath: 'Pictures/MyApp/Images',
        quality: 80,
        skipIfExists: false,
      );

      log('Image saved result: $result');

      // Hide loading dialog
      Get.back();

      if (result.isSuccess) {
        MyDialog.success("Image Downloaded to Gallery.");
      } else {
        MyDialog.error("Failed to save image.");
      }
    } catch (e) {
      // Hide loading dialog
      Get.back();
      MyDialog.error('Something went wrong. Please try again!');
      log('Error downloading image: $e');
    }
  }


  void shareImage() async {
    try {
      MyDialog.showLoadingDialog();

      log('url : $url');

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filepath: ${file.path}');

      Get.back();

      await Share.shareXFiles([XFile(file.path)], text: 'Check out this Amazing Image created by Ai Assistant App by Ashish Kumar');
    }


    catch (e) {
      Get.back();

      MyDialog.error('Something Went Wrong (Try again in sometime)!');
      log('downloadImageE: $e');
    }
  }
}






