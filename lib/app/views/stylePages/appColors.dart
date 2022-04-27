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
  final Color appBarColor = Color(0XFF492260);
  final Color bottomBarColor = Color(0XFF664583);
  final Color blueLinkColor = Color(0XFF5797AF);
  final Color greenColor = const Color(0XFF008001);
  final Color arrowBlackColor = const Color(0XFF4F4C4D);
  final Color blackColor91Percent = const Color(0XFF919191);
  final Color grayColor = const Color(0XFFE1E1E1);
  final Color lightGrayColor = const Color(0XFFF2F1F1);
  final Color grayStepColor = const Color(0XFFC9C9C9);
  final Color grayTabColor = const Color(0XFFCECECE);
  final Color orangeColor = const Color(0XFFEA6F55);
  final Color purpleTabColor = const Color(0XFF5C3876);
  final Color purpleDefaultColor = const Color(0XFF62407E);
  final Color backgroundColor = const Color(0XFFF2F1F1);
  final Color backgroundButtonColor = const Color(0XFF603E7C);

  final List<Color> backgroundFirstScreenColor = const [Color(0XFFE7E3E3), Color(0XFFFFFFFF)];
}