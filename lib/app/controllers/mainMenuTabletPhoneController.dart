import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../enums/enums.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/cardAcademicRecordWidget.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/cardMainMenuWidget.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/tabWidgets/academicTabWidget.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/tabWidgets/homeTabWidget.dart';

class MainMenuTabletPhoneController extends GetxController {
  late int activeStep;
  late String nameInitials;
  late RxBool hasPicture;
  late RxString courseName;
  late RxString welcomePhrase;
  late List<CardMainMenuWidget> cardMainMenuList;
  late List<CardAcademicRecordWidget> cardAcademicRecordList;
  late List<Widget> tabMainMenuList;
  late TabController tabController;
  late CarouselController carouselController;
  late CarouselController academicRecordCarouselController;

  MainMenuTabletPhoneController(){
    _initializeVariables();
    _getValues();
    _loadCards();
    _getWelcomePhrase();
  }

  _initializeVariables(){
    activeStep = 0;
    carouselController = CarouselController();
    academicRecordCarouselController = CarouselController();
    tabMainMenuList = [
      HomeTabWidget(controller: this),
      AcademicTabWidget(controller: this),
      AcademicTabWidget(controller: this),
      AcademicTabWidget(controller: this),
    ];
  }

  _getValues(){
    nameInitials = "WG";
    hasPicture = false.obs;
    courseName = "Ciência da Computação".obs;
  }

  _loadCards(){
    cardMainMenuList = [
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
        fourthText: "7º Semestre",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Próxima Aula",
        secondText: "Banco de Dados",
        thirdText: "19:00 às 20:50",
        fourthText: "25/04",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Próxima Fatura",
        secondText: "R\$ 746,99",
        thirdText: "Vencimento: 05/06",
      ),
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Próxima Prova",
        secondText: "Programação Orientada a Objetos",
        thirdText: "21:00 às 22:30",
        fourthText: "30/06",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Última nota postada",
        secondText: "Nota: 7,75",
        thirdText: "Segurança de Rede de Computadores ddffddffdfdfd",
      ),
    ];

    cardAcademicRecordList = [
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "4º Semestre",
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "4º Semestre",
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "4º Semestre",
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "4º Semestre",
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "4º Semestre",
      ),
    ];
  }

  _getWelcomePhrase() {
    int currentHour = DateTime.now().hour;
    if(currentHour >= 0 && currentHour < 12)
      welcomePhrase = "Bom dia!".obs;
    else if(currentHour >= 12 && currentHour < 18)
      welcomePhrase = "Boa tarde!".obs;
    else
      welcomePhrase = "Boa noite!".obs;
  }

  openProfile() async {
    await Future.delayed(Duration(milliseconds: 200));

  }

  openConfiguration() async {
    await Future.delayed(Duration(milliseconds: 200));

  }

  quickActionsClicked(quickActionsOptions chosenOption) async {
    await Future.delayed(Duration(milliseconds: 200));

    switch(chosenOption){
      case quickActionsOptions.classTime:
        break;
      case quickActionsOptions.gradesFaults:
        break;
      case quickActionsOptions.studentCard:
        break;
      case quickActionsOptions.onlineStudentCard:
        break;
      case quickActionsOptions.academicCalendar:
        break;
      case quickActionsOptions.academicRecord:
        break;
      case quickActionsOptions.schoolStatement:
        break;
      case quickActionsOptions.newsEvents:
        break;
    }
  }
}