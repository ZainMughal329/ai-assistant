import 'package:ai_assistant/components/loading_widget.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/screens/homeScreen/view.dart';
import 'package:ai_assistant/screens/onBoarding/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(seconds: 4),(){
  //     Get.to(()=>HomeView());
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 6),(){
      Pref.showOnboarding ? Get.offAll(()=>OnBoardingScreen()) : Get.offAll(()=> HomeView());
    });
    mq =  MediaQuery.sizeOf(context);

    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex:3),
            Container(
              height: 200,
              width: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blueAccent,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(image: AssetImage('assets/images/logo.png',),width: mq.width * 0.2,),
                  )),
            ),
            Spacer(),
            LoadingWidget(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
