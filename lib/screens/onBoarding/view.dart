import 'package:ai_assistant/components/RoundButton.dart';
import 'package:ai_assistant/components/boardingScreens.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/screens/homeScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cont = PageController();
    final screen = <onBoardingScreen>[
      onBoardingScreen(
          title: "Ask me anything",
          des: "I am your personal AI assistant. How can I help you today?",
          lottie: "onboarding1.json"),
      onBoardingScreen(
          title: "Imagination to Reality",
          des:
              "Create imagination into Images, give me a theme and I'll create one",
          lottie: "onboarding2.json")
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: cont,
          itemCount: screen.length,
          itemBuilder: (context, index) {
            final isLast = index == screen.length - 1;
            // bool isLast = false;
            // if (index == screen.length - 1) {
            //   isLast = true;
            // }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: mq.height * 0.5,
                    width: isLast ? mq.width * 0.7 : null,
                    child: Lottie.asset(
                        'assets/animations/${screen[index].lottie}'),
                  ),
                  Text(
                    screen[index].title.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      letterSpacing: 0.5,

                    ),
                  ),
                  Container(
                    width: mq.width * 0.9,
                    child: Text(
                      screen[index].des.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.w900,
                        // color: Colors.black54,
                        color: Theme.of(context).lightTextColor,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 5,
                    children: List.generate(
                      screen.length,
                      (i) => Container(
                        height: 10,
                        width: i == index ? 20 : 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                i == index ? Theme.of(context).lightButton : Colors.grey),
                      ),
                    ),
                  ),
                  RoundButton(
                    name: isLast ? 'Finish' : 'Next',
                    onPressed: () {
                      if (isLast) {
                        Get.offAll(() => HomeView());
                      } else {
                        cont.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      }
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
