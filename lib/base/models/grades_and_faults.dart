import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreSendEntity.dart';

class GradesAndFaults extends CoreSendEntity{
  //#region Atributos
  late int fault;
  late double grade;
  late String bimester;
  late String semester;
  late String studentId;
  late String id_professor;
  late String id_discipline;
  late String courseId;
  late String educationInstitutionId;
  //#endregion

  //#region Construtor
  GradesAndFaults() : super();
  //#endregion

  //#region Conversões
  GradesAndFaults.fromJson(Map<String, dynamic> json) {
    fault = json["fault"];
    grade = json["grade"];
    bimester = json["bimester"];
    semester = json["semester"];
    studentId = json["studentId"];
    id_professor = json["id_professor"];
    id_discipline = json["id_discipline"];
    courseId = json["courseId"];
    educationInstitutionId = json["educationInstitutionId"];
    active = json["active"];
    lastSync = json["lastSync"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    synced = json["synced"];
  }

  GradesAndFaults.fromJsonFirebase(Map<String, dynamic> json) {
    fault = json["fault"];
    grade = json["grade"];
    bimester = json["bimester"];
    semester = json["semester"];
    studentId = json["studentId"];
    id_professor = json["id_professor"];
    id_discipline = json["id_discipline"];
    courseId = json["courseId"];
    educationInstitutionId = json["educationInstitutionId"];
    active = json["active"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["fault"] = this.fault;
    data["grade"] = this.grade;
    data["bimester"] = this.bimester;
    data["semester"] = this.semester;
    data["studentId"] = this.studentId;
    data["id_professor"] = this.id_professor;
    data["id_discipline"] = this.id_discipline;
    data["courseId"] = this.courseId;
    data["educationInstitutionId"] = this.educationInstitutionId;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    data["lastSync"] = this.lastSync;
    data["synced"] = this.synced;
    return data;
  }
  //#endregion
}