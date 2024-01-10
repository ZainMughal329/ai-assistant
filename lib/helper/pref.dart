import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
 static late Box _box;

  static Future<void> initialize()async{
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
     _box = Hive.box(name:  'myData');
  }


  static bool get showOnboarding => _box.get('showOnboarding' , defaultValue: true);

  static set showOnboarding( bool value) => _box.put('showOnboarding', value);


  static bool get isDarkTheme => _box.get("isDarkTheme")??false;
  static set isDarkTheme(bool v) => _box.put("isDarkTheme", v);


  static ThemeMode defaultTheme(){
    dynamic data = _box.get("isDarkTheme");
    // log("themeModeis"+data);

    if(data == null) return ThemeMode.system;
    if(data == true) return ThemeMode.dark;
    else return ThemeMode.light;
  }



}