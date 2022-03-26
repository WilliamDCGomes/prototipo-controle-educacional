import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PhoneTablet{
  static final PhoneTablet _phoneTablet = PhoneTablet._internal();
  factory PhoneTablet() {
    return _phoneTablet;
  }
  PhoneTablet._internal();

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
}