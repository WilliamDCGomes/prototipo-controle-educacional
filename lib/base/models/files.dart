import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreSendEntity.dart';

class Files extends CoreSendEntity{
  //#region Atributos
  late String? name;
  late String? type;
  late String? byteArray;
  //#endregion

  //#region Construtor
  Files() : super(){
    name = null;
    type = null;
    byteArray = null;
  }
  //#endregion

  //#region Conversões
  Files.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    type = json["type"];
    byteArray = json["byteArray"];
    active = json["active"];
    lastSync = json["lastSync"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    synced = json["synced"];
  }

  Files.fromJsonFirebase(Map<String, dynamic> json) {
    name = json["name"];
    type = json["type"];
    byteArray = json["byteArray"];
    active = json["active"];
    lastSync = (json["lastSync"] as Timestamp).toDate();
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    synced = json["synced"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["type"] = this.type;
    data["byteArray"] = this.byteArray;
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