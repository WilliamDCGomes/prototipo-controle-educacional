import 'package:flutter/material.dart';
import 'package:projeto_tcc/base/models/files.dart';
import '../../app/helpers/date_format_to_brazil.dart';
import '../models/classes.dart';

class CurriculumDeliveryViewController {
  String title;
  String description;
  String disciplineName;
  String? workDescription;
  String? hourStart;
  String? hourEnd;
  DateTime date;
  Color color;
  bool workDelivety;
  List<Classes>? classes;
  List<Files>? workContent;
  List<Files>? workDelivery;

  CurriculumDeliveryViewController(
    {
      required this.title,
      required this.description,
      required this.disciplineName,
      required this.date,
      required this.color,
      required this.workDelivety,
      this.hourStart,
      this.hourEnd,
      this.classes,
      this.workDescription,
      this.workContent,
      this.workDelivery,
    }
  );

  get getFormattedDay {
    String start = hourStart != null ? hourStart! : "";
    String end = hourEnd != null ? hourEnd! : "";
    String hour = (start != "" ? start : "") + (end != "" ? " - $end" : "");
    if(workDelivety) {
      return "${DateFormatToBrazil.weekDay(date)}, ${DateFormatToBrazil.formatDateFull(date)} às $hour";
    }
    return "${DateFormatToBrazil.weekDay(date)}, $hour";
  }

  get getFullDate {
    return "${DateFormatToBrazil.dayAndMounth(date)} - ${DateFormatToBrazil.weekDay(date)}";
  }
}