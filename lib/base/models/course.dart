import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class Course extends CoreEntity{
  //#region Atributos
  late String name;
  //#endregion

  //#region Construtor
  Course() : super();
  //#endregion

  //#region Conversões
  Course.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}