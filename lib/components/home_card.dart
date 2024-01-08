import 'package:ai_assistant/helper/home_type_enum.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({Key? key, required this.homeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        onTap: homeType.onTap,
        child: Container(
          height: mq.height * 0.18,
          child: Card(
            color: AppColors.primaryColor.withOpacity(0.2),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: homeType.allignLeft
                ? Row(
                    children: [
                      Spacer(),
                      Lottie.asset('assets/animations/${homeType.lottie}'),
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        homeType.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Spacer(flex: 2,),
                      Text(
                        homeType.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Lottie.asset('assets/animations/${homeType.lottie}'),

                      // Spacer(
                      //   flex: 1,
                      // ),
                    ],
                  ),
          ).animate(
          ).shimmer(duration: 4.seconds,).scale(duration : 1.seconds),
        ),
      ),
    );
  }
}
