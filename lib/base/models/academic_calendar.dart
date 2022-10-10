import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import 'base/coreEntity.dart';

class AcademicCalendar extends CoreEntity{
  //#region Atributos
  late String educationInstitutionId;
  late String eventName;
  late String eventDescription;
  late String eventPlace;
  late bool isAllDay;
  late bool newsOrEvents;
  late DateTime hourStart;
  late DateTime hourEnd;
  late DateTime eventDay;
  //#endregion

  //#region Construtor
  AcademicCalendar() : super();
  //#endregion

  //#region Encapsulamento
  get background {
    return active ? AppColors.orangeColor : AppColors.purpleDefaultColor;
  }
  //#endregion

  //#region Conversões
  AcademicCalendar.fromJson(Map<String, dynamic> json) {
    educationInstitutionId = json["educationInstitutionId"];
    eventName = json["eventName"];
    eventDescription = json["eventDescription"];
    eventPlace = json["eventPlace"];
    isAllDay = json["isAllDay"];
    newsOrEvents = json["newsOrEvents"];
    hourStart = json["hourStart"];
    hourEnd = json["hourEnd"];
    eventDay = json["eventDay"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  AcademicCalendar.fromJsonFirebase(Map<String, dynamic> json) {
    educationInstitutionId = json["educationInstitutionId"];
    eventName = json["eventName"];
    eventDescription = json["eventDescription"];
    eventPlace = json["eventPlace"];
    isAllDay = json["isAllDay"];
    newsOrEvents = json["newsOrEvents"];
    hourStart = (json["hourStart"] as Timestamp).toDate();
    hourEnd = (json["hourEnd"] as Timestamp).toDate();
    eventDay = (json["eventDay"] as Timestamp).toDate();
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["educationInstitutionId"] = this.educationInstitutionId;
    data["eventName"] = this.eventName;
    data["eventDescription"] = this.eventDescription;
    data["eventPlace"] = this.eventPlace;
    data["isAllDay"] = this.isAllDay;
    data["newsOrEvents"] = this.newsOrEvents;
    data["hourStart"] = this.hourStart;
    data["hourEnd"] = this.hourEnd;
    data["eventDay"] = this.eventDay;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}