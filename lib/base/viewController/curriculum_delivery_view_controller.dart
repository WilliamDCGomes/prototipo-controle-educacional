import 'package:flutter/material.dart';
import '../models/classes.dart';

class CurriculumDeliveryViewController {
  String title;
  String date;
  String description;
  Color color;
  List<Classes>? classes;

  CurriculumDeliveryViewController(
    {
      required this.title,
      required this.date,
      required this.description,
      required this.color,
      this.classes,
    }
  );
}