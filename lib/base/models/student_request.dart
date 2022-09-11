import 'base/coreEntity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentRequest extends CoreEntity{
  //#region Atributos
  late bool paid;
  late int studentRa;
  late double value;
  late String disciplineId;
  late String observation;
  late String requestType;
  late String paymentCardId;
  late String paymentMethod;
  late String educationalInstitutionId;
  late DateTime? paymentDate;
  late DateTime requestDate;
  //#endregion

  //#region Construtor
  StudentRequest() : super(){
    paymentDate = null;
  }
  //#endregion

  //#region Conversões
  StudentRequest.fromJson(Map<String, dynamic> json) {
    paid = json["paid"];
    studentRa = json["student_ra"];
    value = json["value"];
    disciplineId = json["discipline_id"];
    observation = json["observation"];
    requestType = json["request_type"];
    paymentCardId = json["payment_card_id"];
    paymentMethod = json["payment_method"];
    educationalInstitutionId = json["educational_institution_id"];
    paymentDate = json["payment_date"];
    requestDate = json["request_date"];
    id = json["id"];
    lastChange = json["lastChange"];
    includeDate = json["includeDate"];
    active = json["active"];
  }

  StudentRequest.fromJsonFirebase(Map<String, dynamic> json) {
    paid = json["paid"];
    studentRa = json["student_ra"];
    value = json["value"];
    disciplineId = json["discipline_id"];
    observation = json["observation"];
    requestType = json["request_type"];
    paymentCardId = json["payment_card_id"];
    paymentMethod = json["payment_method"];
    educationalInstitutionId = json["educational_institution_id"];
    if(json["payment_date"] != null){
      paymentDate = (json["payment_date"] as Timestamp).toDate();
    }
    else{
      paymentDate = null;
    }
    requestDate = (json["request_date"] as Timestamp).toDate();
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["paid"] = this.paid;
    data["student_ra"] = this.studentRa;
    data["value"] = this.value;
    data["discipline_id"] = this.disciplineId;
    data["observation"] = this.observation;
    data["request_type"] = this.requestType;
    data["payment_card_id"] = this.paymentCardId;
    data["payment_method"] = this.paymentMethod;
    data["educational_institution_id"] = this.educationalInstitutionId;
    data["payment_date"] = this.paymentDate;
    data["request_date"] = this.requestDate;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}