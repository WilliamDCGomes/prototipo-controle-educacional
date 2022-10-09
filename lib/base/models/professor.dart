import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class Professor extends CoreEntity{
  //#region Atributos
  late String cpf;
  late String educationInstitutionId;
  late String professorTitle;
  //#endregion

  //#region Construtor
  Professor() : super();
  //#endregion

  //#region Conversões
  Professor.fromJson(Map<String, dynamic> json) {
    cpf = json["cpf"];
    educationInstitutionId = json["educationInstitutionId"];
    professorTitle = json["professorTitle"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  Professor.fromJsonFirebase(Map<String, dynamic> json) {
    cpf = json["cpf"];
    educationInstitutionId = json["educationInstitutionId"];
    professorTitle = json["professorTitle"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["cpf"] = this.cpf;
    data["educationInstitutionId"] = this.educationInstitutionId;
    data["professorTitle"] = this.professorTitle;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}