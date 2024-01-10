import 'package:ai_assistant/components/home_card.dart';
import 'package:ai_assistant/helper/home_type_enum.dart';
import 'package:ai_assistant/helper/api.dart';
import 'package:ai_assistant/helper/appColors.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/helper/pref.dart';
import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  final _isdark = Pref.isDarkTheme.obs;
  HomeView({Key? key}) : super(key: key);

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
              // color: AppColors.primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
        elevation: 1,
        actions: [

          IconButton(
            onPressed: () {
              Get.changeThemeMode(Pref.isDarkTheme ? ThemeMode.light : ThemeMode.dark);

              Pref.isDarkTheme = !Pref.isDarkTheme;
              _isdark.value = !_isdark.value;
            },
            icon: Obx(() => _isdark.value ? Icon(Icons.light_mode_outlined,size: 30,) : Icon(
              Icons.dark_mode_outlined,
              size: 30,
              // color: Theme.of(context).lightButton,
            ),),
          ),
          SizedBox(width: 10,),
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
