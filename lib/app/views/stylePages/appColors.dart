import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appColors = AppColors._internal();
  factory AppColors() {
    return _appColors;
  }
  AppColors._internal();

  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;
  final Color transparentColor = Colors.transparent;
  final Color standardColor = Color(0XFF62407E);
  final Color greenColor = const Color(0XFF008001);
  final Color blackColor91Percent = const Color(0XFF919191);
  final Color grayColor = const Color(0XFFE1E1E1);
  final Color backgroundFirstScreenColor = const Color(0XFFF6F6F6);
  final Color purpleDefaultColor = const Color(0XFF62407E);
}