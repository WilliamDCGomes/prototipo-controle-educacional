import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class DisciplinePeriods extends CoreEntity{
  //#region Atributos
  late String courseId;
  late List<dynamic> period;
  //#endregion

  //#region Construtor
  DisciplinePeriods() : super();
  //#endregion

  //#region Conversões
  DisciplinePeriods.fromJson(Map<String, dynamic> json) {
    courseId = json["course_id"];
    period = json["period"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["course_id"] = this.courseId;
    data["period"] = this.period;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}