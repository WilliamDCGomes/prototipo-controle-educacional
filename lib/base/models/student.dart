import 'package:cloud_firestore/cloud_firestore.dart';
import 'base/coreEntity.dart';

class Student extends CoreEntity{
  //#region Atributos
  late String name;
  late String birthdate;
  late String cpf;
  late String gender;
  late String cep;
  late String uf;
  late String city;
  late String street;
  late String? houseNumber;
  late String neighborhood;
  late String complement;
  late String educationInstitutionName;
  late String course;
  late String period;
  late String? phone;
  late String? cellPhone;
  late String email;
  late String password;
  //#endregion

  //#region Construtor
  Student() : super();
  //#endregion

  //#region Conversões
  Student.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    birthdate = json["birthdate"];
    cpf = json["cpf"];
    gender = json["gender"];
    cep = json["cep"];
    uf = json["uf"];
    city = json["city"];
    street = json["street"];
    houseNumber = json["houseNumber"];
    neighborhood = json["neighborhood"];
    complement = json["complement"];
    educationInstitutionName = json["educationInstitutionName"];
    course = json["course"];
    period = json["period"];
    phone = json["phone"];
    cellPhone = json["cellPhone"];
    email = json["email"];
    password = json["password"];
    id = json["id"];
    lastChange = (json["lastChange"] as Timestamp).toDate();
    includeDate = (json["includeDate"] as Timestamp).toDate();
    active = json["active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["birthdate"] = this.birthdate;
    data["cpf"] = this.cpf;
    data["gender"] = this.gender;
    data["cep"] = this.cep;
    data["uf"] = this.uf;
    data["city"] = this.city;
    data["street"] = this.street;
    data["houseNumber"] = this.houseNumber;
    data["neighborhood"] = this.neighborhood;
    data["complement"] = this.complement;
    data["educationInstitutionName"] = this.educationInstitutionName;
    data["course"] = this.course;
    data["period"] = this.period;
    data["phone"] = this.phone;
    data["cellPhone"] = this.cellPhone;
    data["email"] = this.email;
    data["password"] = this.password;
    data["id"] = this.id;
    data["lastChange"] = this.lastChange;
    data["includeDate"] = this.includeDate;
    data["active"] = this.active;
    return data;
  }
  //#endregion
}