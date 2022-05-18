import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/card_academic_record_widget.dart';

class GradesFaultsController extends GetxController {
  late List<CardAcademicRecordWidget> cardAcademicRecordList;
  late CarouselController academicRecordCarouselController;
  late TextEditingController searchDisciplineController;

  GradesFaultsController(){
    _inicializeVariables();
    _loadList();
  }

  _inicializeVariables(){
    searchDisciplineController = TextEditingController();
    academicRecordCarouselController = CarouselController();
  }

  _loadList(){
    cardAcademicRecordList = [
      CardAcademicRecordWidget(
        yearValueText: "2019",
        semesterValueText: "1º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2019",
        semesterValueText: "2º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2020",
        semesterValueText: "3º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2020",
        semesterValueText: "4º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2021",
        semesterValueText: "5º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2021",
        semesterValueText: "6º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "7º Semestre",
        gadesFaultsController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "8º Semestre",
        gadesFaultsController: this,
      ),
    ];
  }

  previousAcademicRecordCard() async {
    await Future.delayed(Duration(milliseconds: 100));
    academicRecordCarouselController.previousPage();
  }

  nextAcademicRecordCard() async {
    await Future.delayed(Duration(milliseconds: 100));
    academicRecordCarouselController.nextPage();
  }
}