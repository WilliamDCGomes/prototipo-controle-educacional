import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformType{
  static final PlatformType _platformType = PlatformType._internal();
  factory PlatformType() {
    return _platformType;
  }
  PlatformType._internal();

  bool isPhone(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  bool isTablet(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  bool isWeb(){
    return kIsWeb;
  }

  bool isWatch(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 250;
  }

  bool isAndroid(){
    return Platform.isAndroid;
  }
}