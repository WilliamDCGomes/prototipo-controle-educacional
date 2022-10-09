import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../models/academic_calendar.dart';

class MeetingDataSourceViewController extends CalendarDataSource {
  MeetingDataSourceViewController(List<AcademicCalendar> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].hourStart;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].hourEnd;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}