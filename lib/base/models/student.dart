import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class Student extends CoreEntity{
  //#region Atributos
  late int ra;
  late int bimester;
  late int semester;
  late int studentYear;
  late String cpf;
  late String educationInstitutionId;
  late String courseId;
  late String period;
  late String password;
  //#endregion

  //#region Construtor
  Student() : super(){
    bimester = 1;
    semester = 1;
    studentYear = 1;
  }
  //#endregion

  //#region Conversões
  Student.fromJson(Map<String, dynamic> json) {
    ra = json["ra"];
    cpf = json["cpf"];
    bimester = json["bimester"];
    semester = json["semester"];
    studentYear = json["studentYear"];
    educationInstitutionId = json["educationInstitutionId"];
    courseId = json["courseId"];
    period = json["period"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  Student.fromJsonFirebase(Map<String, dynamic> json) {
    ra = json["ra"];
    cpf = json["cpf"];
    bimester = json["bimester"];
    semester = json["semester"];
    studentYear = json["studentYear"];
    educationInstitutionId = json["educationInstitutionId"];
    courseId = json["courseId"];
    period = json["period"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["ra"] = this.ra;
    data["cpf"] = this.cpf;
    data["bimester"] = this.bimester;
    data["semester"] = this.semester;
    data["studentYear"] = this.studentYear;
    data["educationInstitutionId"] = this.educationInstitutionId;
    data["courseId"] = this.courseId;
    data["period"] = this.period;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}