import 'base/coreEntity.dart';

class Classes extends CoreEntity{
  //#region Atributos
  late String? className;
  late String? classSubject;
  late String? disciplineName;
  late String? classDescription;
  late String? professorName;
  late DateTime? classDate;
  //#endregion

  //#region Construtor
  Classes() : super(){
    className = null;
    classSubject = null;
    disciplineName = null;
    classDescription = null;
    professorName = null;
    classDate = null;
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
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
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
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}