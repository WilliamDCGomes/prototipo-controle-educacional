import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class RaInformation extends CoreEntity{
  //#region Atributos
  late int ra;
  late String studentId;
  late String educationInstitutionId;
  //#endregion

  //#region Construtor
  RaInformation() : super();
  //#endregion

  //#region Conversões
  RaInformation.fromJson(Map<String, dynamic> json) {
    ra = json["ra"];
    studentId = json["studentId"];
    educationInstitutionId = json["educationInstitutionId"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  RaInformation.fromJsonFirebase(Map<String, dynamic> json) {
    ra = json["ra"];
    studentId = json["studentId"];
    educationInstitutionId = json["educationInstitutionId"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["ra"] = this.ra;
    data["studentId"] = this.studentId;
    data["educationInstitutionId"] = this.educationInstitutionId;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}