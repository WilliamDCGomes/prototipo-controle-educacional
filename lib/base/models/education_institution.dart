import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class EducationInstitution extends CoreEntity{
  //#region Atributos
  late String name;
  late List<dynamic> courses;
  //#endregion

  //#region Construtor
  EducationInstitution() : super();
  //#endregion

  //#region Conversões
  EducationInstitution.fromJson(Map<String, dynamic> json) {
    courses = <dynamic>[];
    name = json["name"];
    courses = json["courses"]["id_course"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  EducationInstitution.fromJsonFirebase(Map<String, dynamic> json) {
    courses = <dynamic>[];
    name = json["name"];
    for(var course in json["courses"]){
      courses.add(course["id_course"]);
    }
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["courses"] = {
      "id_course": this.courses,
    };
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}