//import 'package:odo/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odo/helper/global.dart';
import 'package:odo/helper/pref.dart';
import 'package:odo/screen/home_screen.dart';
import 'package:odo/screen/onboarding_screen.dart';
import 'package:odo/widget/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
    if (mounted) {


      // Check if the widget is still in the tree
    Get.off(() =>
        Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen());


      //Navigator.of(context).pushReplacement(
     //MaterialPageRoute(builder: (_) => Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen()),
    //);
  }
});

  }

  @override
  Widget build(BuildContext context) {
    // initializing the device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [

             const Spacer(flex: 2,),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset('assets/images/logo.png', width: mq.width * .45),
              ),
            ),

            const Spacer(),

            const CustomLoading(),

            const Spacer()


          ],
        ),
      ),
    );
  }
}
