import 'package:flutter/material.dart';
import '../../app/helpers/date_format_to_brazil.dart';
import '../models/classes.dart';

class CurriculumDeliveryViewController {
  String title;
  String description;
  String? hourStart;
  String? hourEnd;
  DateTime date;
  Color color;
  List<Classes>? classes;

  CurriculumDeliveryViewController(
    {
      required this.title,
      required this.description,
      required this.date,
      required this.color,
      this.hourStart,
      this.hourEnd,
      this.classes,
    }
  );

  get getFormattedDay {
    return "${DateFormatToBrazil.weekDay(date)}, $hourStart - $hourEnd";
  }

  get getFullDate {
    return "${DateFormatToBrazil.dayAndMounth(date)} - ${DateFormatToBrazil.weekDay(date)}";
  }
}