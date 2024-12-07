import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:odo/helper/global.dart';
import 'package:flutter/services.dart';
import 'package:odo/helper/pref.dart';
import 'package:odo/model/home_type.dart';
import 'package:odo/widget/home_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode =Get.isDarkMode.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }
  @override
  Widget build(BuildContext context) {
    // initializing the device size
    mq = MediaQuery.sizeOf(context);
    //APIs.getAnswer('hii');
    return Scaffold(

      appBar: AppBar(

        title: const Text(appName,),

        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 10),

              onPressed: () {
                Get.changeThemeMode(
                  _isDarkMode.value ? ThemeMode.light :ThemeMode.dark);
                _isDarkMode.value = !_isDarkMode.value;
                Pref.isDarkMode= _isDarkMode.value;


              },
              icon:  Obx(
                () =>
                 Icon(
                   _isDarkMode.value ? Icons.brightness_2_rounded :
                   Icons.brightness_5_rounded,

                  size: 26,
                ),
              )
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * .04, vertical: mq.height * .015
        ),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),

    );
  }
}
