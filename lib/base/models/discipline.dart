import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';
import 'discipline_period.dart';

class Discipline extends CoreEntity{
  //#region Atributos
  late String name;
  late String classroom;
  late String id_professor;
  late String semester;
  late String workload;
  late List<DisciplinePeriod> disciplinesPeriod;
  //#endregion

  //#region Construtor
  Discipline() : super();
  //#endregion

  //#region Conversões
  Discipline.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    classroom = json["classroom"];
    id_professor = json["id_professor"];
    semester = json["semester"];
    workload = json["workload"];
    disciplinesPeriod = json["period"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  Discipline.fromJsonFirebase(Map<String, dynamic> json) {
    disciplinesPeriod = <DisciplinePeriod>[];
    name = json["name"] ?? "";
    classroom = json["classroom"] ?? "";
    id_professor = json["id_professor"] ?? "";
    semester = json["semester"] ?? "";
    workload = json["workload"] ?? "";
    for(var period in json["period"]){
      DisciplinePeriod _disciplinePeriod = DisciplinePeriod();
      _disciplinePeriod.day = period["day"] ?? "";
      _disciplinePeriod.start_hour = (period["start_hour"] ?? "").replaceAll('h', '');
      _disciplinePeriod.end_hour = (period["end_hour"] ?? "").replaceAll('h', '');
      _disciplinePeriod.moment = period["moment"] ?? "";
      disciplinesPeriod.add(_disciplinePeriod);
    }
    id = json["id_discipline"] ?? "";
    if(json["lastChange"] != null){
      lastChange = (json["lastChange"] as Timestamp).toDate();
    }
    if(json["includeDate"] != null){
      includeDate = (json["includeDate"] as Timestamp).toDate();
    }
    active = json["active"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["classroom"] = this.classroom;
    data["id_professor"] = this.id_professor;
    data["semester"] = this.semester;
    data["workload"] = this.workload;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    data["period"] = this.disciplinesPeriod;
    return data;
  }
  //#endregion
}