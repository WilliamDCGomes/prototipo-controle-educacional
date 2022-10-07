import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class OnlineStudentCard extends CoreEntity{
  //#region Atributos
  late String userId;
  late String onlineCardNumber;
  late DateTime expirationDate;
  //#endregion

  //#region Construtor
  OnlineStudentCard() : super(){
    onlineCardNumber = "0000 0000 0000 0000";
    expirationDate = DateTime.now();
  }
  //#endregion

  //#region Conversões
  OnlineStudentCard.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    onlineCardNumber = json["onlineCardNumber"];
    expirationDate = json["expirationDate"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  OnlineStudentCard.fromJsonFirebase(Map<String, dynamic> json) {
    userId = json["userId"];
    onlineCardNumber = json["onlineCardNumber"];
    expirationDate = (json["expirationDate"] as Timestamp).toDate();
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["onlineCardNumber"] = this.onlineCardNumber;
    data["expirationDate"] = this.expirationDate;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}