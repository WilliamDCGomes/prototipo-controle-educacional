import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';
import 'discipline_period.dart';

class CustomNotification {
  //#region Atributos
  final int id;
  final String? title;
  final String? body;
  final String? payload;
  //#endregion

  //#region Construtor
  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });
  //#endregion
}