import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class RegistrationCancellation extends CoreEntity{
  //#region Atributos
  late int ra;
  late int reasonCancellation;
  late String cpf;
  late String courseId;
  late String educationInstitutionId;
  late String otherReasonCancellation;
  //#endregion

  //#region Construtor
  RegistrationCancellation() : super(){
    otherReasonCancellation = "";
  }
  //#endregion

  //#region Conversões
  RegistrationCancellation.fromJson(Map<String, dynamic> json) {
    ra = json["ra"];
    cpf = json["cpf"];
    educationInstitutionId = json["educationInstitutionId"];
    courseId = json["courseId"];
    reasonCancellation = json["reasonCancellation"];
    otherReasonCancellation = json["otherReasonCancellation"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  RegistrationCancellation.fromJsonFirebase(Map<String, dynamic> json) {
    ra = json["ra"];
    cpf = json["cpf"];
    educationInstitutionId = json["educationInstitutionId"];
    courseId = json["courseId"];
    reasonCancellation = json["reasonCancellation"];
    otherReasonCancellation = json["otherReasonCancellation"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["ra"] = this.ra;
    data["cpf"] = this.cpf;
    data["educationInstitutionId"] = this.educationInstitutionId;
    data["courseId"] = this.courseId;
    data["reasonCancellation"] = this.reasonCancellation;
    data["otherReasonCancellation"] = this.otherReasonCancellation;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}