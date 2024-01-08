import 'package:ai_assistant/components/home_card.dart';
import 'package:ai_assistant/helper/home_type_enum.dart';
import 'package:ai_assistant/helper/api.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;

    // APIs().getAnswer('Hi! how are you?');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.brightness_4_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          // adding all values in enum into list and assigning this list to the children[] of ListView
          // e the the value of HomeType
          children: HomeType.values.map((e) => HomeCard(homeType: e,)).toList(),
        ),
      ),
    );
  }
}
