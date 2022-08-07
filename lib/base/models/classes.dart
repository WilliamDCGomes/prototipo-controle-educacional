import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';
import 'files.dart';

class Classes extends CoreEntity{
  //#region Atributos
  late String? className;
  late String? classSubject;
  late String? disciplineName;
  late String? classDescription;
  late String? professorName;
  late DateTime? classDate;
  late List<Files> files;
  //#endregion

  //#region Construtor
  Classes() : super(){
    className = null;
    classSubject = null;
    disciplineName = null;
    classDescription = null;
    professorName = null;
    classDate = null;
    files = [];
  }
  //#endregion

  //#region Conversões
  Classes.fromJson(Map<String, dynamic> json) {
    className = json["className"];
    classSubject = json["classSubject"];
    disciplineName = json["disciplineName"];
    classDescription = json["classDescription"];
    professorName = json["professorName"];
    classDate = json["classDate"];
    files = json["files"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  Classes.fromJsonFirebase(Map<String, dynamic> json) {
    className = json["className"];
    classSubject = json["classSubject"];
    disciplineName = json["disciplineName"];
    classDescription = json["classDescription"];
    professorName = json["professorName"];
    classDate = json["classDate"];
    files = json["files"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["className"] = this.className;
    data["classSubject"] = this.classSubject;
    data["disciplineName"] = this.disciplineName;
    data["classDescription"] = this.classDescription;
    data["professorName"] = this.professorName;
    data["classDate"] = this.classDate;
    data["files"] = this.files;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}