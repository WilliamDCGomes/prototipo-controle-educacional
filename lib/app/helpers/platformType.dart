import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformType{
  static bool isPhone(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  static bool isTablet(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  static bool isWeb(){
    return kIsWeb;
  }

  static bool isWatch(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 250;
  }

  static bool isAndroid(){
    return Platform.isAndroid;
  }
}