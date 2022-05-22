import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';

class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  bool isAllDay;
  late Color background;

  Meeting(this.eventName, this.from, this.to, this.isAllDay){
    background = AppColors.orangeColor;
  }
}