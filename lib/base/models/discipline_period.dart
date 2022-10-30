import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class DisciplinePeriod extends CoreEntity{
  //#region Atributos
  late String day;
  late String start_hour;
  late String end_hour;
  late String moment;
  //#endregion

  //#region Construtor
  DisciplinePeriod() : super();
  //#endregion

  //#region Conversões
  DisciplinePeriod.fromJson(Map<String, dynamic> json) {
    day = json["day"];
    start_hour = json["start_hour"];
    end_hour = json["end_hour"];
    moment = json["moment"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  DisciplinePeriod.fromJsonFirebase(Map<String, dynamic> json) {
    day = json["day"];
    start_hour = json["start_hour"];
    end_hour = json["end_hour"];
    moment = json["moment"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["day"] = this.day;
    data["start_hour"] = this.start_hour;
    data["end_hour"] = this.end_hour;
    data["moment"] = this.moment;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}