import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/date_format_to_brazil.dart';

class StudentRequestController extends GetxController {
  late RxString requestTitle;
  late RxString requestSelected;
  late RxList<String> requestTypeList;
  late TextEditingController studentName;
  late TextEditingController raNumber;
  late TextEditingController dateRequest;
  late TextEditingController observations;
  late studentTypeRequest studentRequest;

  StudentRequestController(this.studentRequest){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    switch(studentRequest){
      case studentTypeRequest.studentCard:
        requestSelected = requestTypeList[0].obs;
        requestTitle = requestTypeList[0].obs;
        break;
      case studentTypeRequest.schoolStatement:
        requestSelected = requestTypeList[1].obs;
        requestTitle = requestTypeList[1].obs;
        break;
    }
    studentName = TextEditingController();
    raNumber = TextEditingController();
    dateRequest = TextEditingController();
    observations = TextEditingController();

    studentName.text = "William Douglas Costa Gomes";
    raNumber.text = "48467";
    dateRequest.text = DateFormatToBrazil.formatDate(DateTime.now());
  }

  _inicializeList(){
    requestTypeList = [
      "Carteirinha de Estudante",
      "Declaração Escolar",
    ].obs;
  }

  onDropdownButtonWidgetChanged(String? selectedState){
    requestSelected.value = selectedState ?? "";
    if(selectedState != null){
      requestTitle.value = selectedState;
    }
  }
}