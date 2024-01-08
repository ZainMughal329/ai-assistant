import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.4;
    return Container(
      child: Lottie.asset(
        'assets/animations/loading.json', width: width,
        // frameRate: FrameRate.max
      ),
    );
  }
}
