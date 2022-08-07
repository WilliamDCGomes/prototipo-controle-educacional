class AddressInformation {
  late String uf;
  late String city;
  late String street;
  late String neighborhood;
  late String complement;

  AddressInformation.fromJson(Map<String, dynamic> json) {
    uf = json["uf"];
    city = json["localidade"];
    street = json["logradouro"];
    neighborhood = json["bairro"];
    complement = json["complemento"];
  }

  AddressInformation.fromJsonFirebase(Map<String, dynamic> json) {
    uf = json["uf"];
    city = json["localidade"];
    street = json["logradouro"];
    neighborhood = json["bairro"];
    complement = json["complemento"];
  }
}