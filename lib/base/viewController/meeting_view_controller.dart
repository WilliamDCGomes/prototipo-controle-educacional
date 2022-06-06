import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';

class MeetingViewController {
  String eventName;
  String eventDescription;
  String eventPlace;
  DateTime from;
  DateTime to;
  DateTime eventDay;
  bool isAllDay;
  late Color background;

  MeetingViewController(
    this.eventName,
    this.eventDescription,
    this.eventPlace,
    this.from,
    this.to,
    this.eventDay,
    this.isAllDay,
  ){
    background = AppColors.orangeColor;
  }
}