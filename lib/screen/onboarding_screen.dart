import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:odo/helper/global.dart';
import 'package:odo/main.dart';
import 'package:odo/model/onboard.dart';
import 'package:odo/screen/home_screen.dart';
import 'package:odo/widget/custom_btn.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      // onboarding 1
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend and You can ask me anything & I will help you!',
          lottie: 'ai_ask_me'),
      // onboarding 2

      Onboard(
          title: 'Imagination to reality',
          subtitle:
              'Just imagine anything & let me know, I will create something wonderful for you ',
          lottie: 'ai_play')
    ];
    return Scaffold(
        body: PageView.builder(
            controller: c,
            itemCount: list.length,
            itemBuilder: (ctx, ind) {
              final isLast = ind == list.length - 1;

              return Column(
                children: [
                  // lottie
                  Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                      height: mq.height * .6,
                      width: isLast ? mq.width * .7 : null),

                  //title
                  Text(
                    list[ind].title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5),
                  ),

                  SizedBox(height: mq.height * 0.018),

                  // Subtitle
                  SizedBox(
                    width: mq.width * .7,
                    child: Text(
                      list[ind].subtitle,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          fontSize: 13.5,
                          letterSpacing: .5,
                          color: Theme.of(context).lightTextColor),
                    ),
                  ),

                  const Spacer(),
                  // dot

                  Wrap(
                    spacing: 10,
                    children: List.generate(
                        list.length, //it will have the number of items (onboarding screen) in the list
                        (i) => Container(
                              width: i == ind ? 15 : 10,
                              height: 8,
                              decoration: BoxDecoration(
                                  color:
                                      i == ind ? Colors.lightBlue : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                            )),
                  ),

                  const Spacer(),

                  //button
                  CustomBtn(
                      onTap: () {
                        if (isLast) {
                          Get.off(() => const HomeScreen());

                          /* Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => const HomeScreen() )); */
                        } else {
                          c.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.ease);
                        }
                      },
                      text: isLast ? 'Finish' : 'Next'),

                  const Spacer(
                    flex: 2,
                  )
                ],
              );
            })
    );
  }
}
