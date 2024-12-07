import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odo/controller/chat_controller.dart';
import 'package:odo/main.dart';
import 'package:odo/widget/message_card.dart';

import '../../helper/global.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}



class _ChatbotFeatureState extends State<ChatbotFeature> {

  final _c= ChatController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI Assistant'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                  onTapOutside: (e) => FocusScope.of(context).unfocus(), // on taping outside the border typing screen it will put keyboard down
                  controller: _c.textC,
              textAlign: TextAlign.center,

              decoration:  InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),

            // for adding some space
            const SizedBox(width: 8),


            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).buttonColor,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: const Icon(
                  Icons.rocket_launch_rounded,

                color: Colors.white,
                size: 28,
              ),
            )
            )
          ],
        ),
      ),
      body: Obx(
          () => ListView(
            physics: const BouncingScrollPhysics(),
            controller: _c.scrollC,
            padding: EdgeInsets.only(top: mq.height* .02, bottom: mq.height *0.1) ,
            children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
