import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/style-Pages/app-colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../enums/enums.dart';
import '../helpers/paths.dart';
import '../views/components-Widgets/credit-debt-card-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/card-academic-record-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/card-main-menu-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/component-tab-widget/academic-tab-list-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/academic-tab-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/component-tab-widget/card-payment-list-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/component-tab-widget/card-profile-tab-list-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/component-tab-widget/card-tab-list-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/financial-tab-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/home-tab-widget.dart';
import '../views/components-Widgets/tablet-phone-component-widget/tab-widgets/profile-tab-widget.dart';

class MainMenuTabletPhoneController extends GetxController {
  late int activeStep;
  late int creditDebtCardActiveStep;
  late String nameInitials;
  late double creditDebtCardWidgetHeight;
  late RxBool hasPicture;
  late RxString courseName;
  late RxString welcomePhrase;
  late List<CardMainMenuWidget> cardMainMenuList;
  late List<CardProfileTabListWidget> cardProfileTabList;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late List<CardAcademicRecordWidget> cardAcademicRecordList;
  late List<CardPaymentListWidget> cardPaymentList;
  late List<Widget> curriculumTabList;
  late List<Widget> deliveryTabList;
  late List<Widget> tabMainMenuList;
  late List<Widget> tabAcademicRecordList;
  late TabController tabController;
  late TabController tabAcademicController;
  late TabController tabFinancialController;
  late CarouselController carouselController;
  late CarouselController carouselCreditDebtCardController;
  late CarouselController academicRecordCarouselController;
  late TextEditingController curriculumSearchController;
  late TextEditingController deliveriesSearchController;

  MainMenuTabletPhoneController(){
    _initializeVariables();
    _getValues();
    _loadCards();
    _getWelcomePhrase();
  }

  _initializeVariables(){
    activeStep = 0;
    creditDebtCardWidgetHeight = 20.h;
    creditDebtCardActiveStep = 0;
    carouselController = CarouselController();
    carouselCreditDebtCardController = CarouselController();
    academicRecordCarouselController = CarouselController();
    curriculumSearchController = TextEditingController();
    deliveriesSearchController = TextEditingController();
    tabMainMenuList = [
      HomeTabWidget(controller: this),
      AcademicTabWidget(controller: this),
      FinancialTabWidget(controller: this),
      ProfileTabWidget(controller: this),
    ];
    tabAcademicRecordList = [
      AcademicTabListWidget(
        controller: this,
        academicTabType: academicTabs.curriculum,
      ),
      AcademicTabListWidget(
        controller: this,
        academicTabType: academicTabs.deliveries,
      ),
    ];
    curriculumTabList = [
      CardTabListWidget(
        firstValue: "Projeto I",
        secondValue: "Segunda-Feira, 19:00 - 20:40",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 0,
      ),
      CardTabListWidget(
        firstValue: "Qualidade e Testes de Software",
        secondValue: "Segunda-Feira, 21:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 1,
      ),
      CardTabListWidget(
        firstValue: "Tópicos em Computação",
        secondValue: "Terça-Feira, 19:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 2,
      ),
      CardTabListWidget(
        firstValue: "Projeto I",
        secondValue: "Quarta-Feira, 19:00 - 20:40",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 3,
      ),
      CardTabListWidget(
        firstValue: "Segurança em Sistemas de Informação",
        secondValue: "Quarta-Feira, 21:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 4,
      ),
      CardTabListWidget(
        firstValue: "Ciência de Dados I",
        secondValue: "Quinta-Feira, 19:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 5,
      ),
      CardTabListWidget(
        firstValue: "Modelagem Computacional em Grafos",
        secondValue: "Sexta-Feira, 19:00 - 20:40",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 6,
      ),
      CardTabListWidget(
        firstValue: "Pesquisa Operacional",
        secondValue: "Sexta-Feira, 19:00 - 20:40",
        thirdValue: "Sala D14",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 7,
      ),
    ];
    deliveryTabList = [
      CardTabListWidget(
        firstValue: "Lista de Exercícios I",
        secondValue: "Segunda-Feira, 12/04 às 20:40",
        thirdValue: "Banco de Dados",
        cardColor: AppColors.orangeColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 0,
      ),
      CardTabListWidget(
        firstValue: "Lista de Exercícios II",
        secondValue: "Quinta-Feira, 15/04 às 21:00",
        thirdValue: "Projeto I",
        cardColor: AppColors.orangeColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 1,
      ),
      CardTabListWidget(
        firstValue: "Trabalho de Segurança",
        secondValue: "Quarta-Feira, 14/04 às 19:00",
        thirdValue: "Segurança de Sistema",
        cardColor: AppColors.orangeColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 2,
      ),
      CardTabListWidget(
        firstValue: "Lista de Matemática",
        secondValue: "Sexta-Feira, 16/04 às 21:30",
        thirdValue: "Matemática",
        cardColor: AppColors.orangeColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 3,
      ),
    ];
    cardPaymentList = [
      CardPaymentListWidget(
        firstValue: "Futura",
        secondValue: "05/07/2022",
        thirdValue: "R\$ 743,99",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 0,
      ),
      CardPaymentListWidget(
        firstValue: "Futura",
        secondValue: "05/08/2022",
        thirdValue: "R\$ 743,99",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 0,
      ),
      CardPaymentListWidget(
        firstValue: "Futura",
        secondValue: "05/09/2022",
        thirdValue: "R\$ 743,99",
        cardColor: AppColors.purpleDefaultColor,
        mainMenuTabletPhoneController: this,
        itemIndex: 0,
      ),
    ];
    cardProfileTabList = [
      CardProfileTabListWidget(
        id: 0,
        iconCard: SvgPicture.asset(
          Paths.Icone_Noticias_e_Eventos,
        ),
        titleIconPath: "Notícias e Eventos",
        mainMenuTabletPhoneController: this,
      ),
      CardProfileTabListWidget(
        id: 1,
        iconCard: Icon(
          Icons.settings,
          color: AppColors.purpleDefaultColor,
          size: 5.h,
        ),
        titleIconPath: "Configurações",
        mainMenuTabletPhoneController: this,
      ),
      CardProfileTabListWidget(
        id: 2,
        iconCard: SvgPicture.asset(
          Paths.Icone_Redefinir_Senha,
        ),
        titleIconPath: "Redefinir Senha",
        mainMenuTabletPhoneController: this,
      ),
      CardProfileTabListWidget(
        id: 3,
        iconCard: Icon(
          Icons.qr_code_scanner,
          color: AppColors.purpleDefaultColor,
          size: 5.h,
        ),
        titleIconPath: "Vincular SmartWactch",
        mainMenuTabletPhoneController: this,
      ),
      CardProfileTabListWidget(
        id: 4,
        iconCard: SvgPicture.asset(
          Paths.Icone_Sair,
        ),
        titleIconPath: "Sair",
        mainMenuTabletPhoneController: this,
      ),
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
        imagePath: "icone-notificacao.svg",
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
        fourthText: "7º Semestre",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "icone-notificacao.svg",
        firstText: "Próxima Aula",
        secondText: "Banco de Dados",
        thirdText: "19:00 às 20:50",
        fourthText: "25/04",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "icone-notificacao.svg",
        firstText: "Próxima Fatura",
        secondText: "R\$ 746,99",
        thirdText: "Vencimento: 05/06",
      ),
      CardMainMenuWidget(
        imagePath: "icone-notificacao.svg",
        firstText: "Próxima Prova",
        secondText: "Programação Orientada a Objetos",
        thirdText: "21:00 às 22:30",
        fourthText: "30/06",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "icone-notificacao.svg",
        firstText: "Última nota postada",
        secondText: "Nota: 7,75",
        thirdText: "Segurança de Rede de Computadores ddffddffdfdfd",
      ),
    ];

    cardAcademicRecordList = [
      CardAcademicRecordWidget(
        yearValueText: "2019",
        semesterValueText: "1º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2019",
        semesterValueText: "2º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2020",
        semesterValueText: "3º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2020",
        semesterValueText: "4º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2021",
        semesterValueText: "5º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2021",
        semesterValueText: "6º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "7º Semestre",
        mainMenuTabletPhoneController: this,
      ),
      CardAcademicRecordWidget(
        yearValueText: "2022",
        semesterValueText: "8º Semestre",
        mainMenuTabletPhoneController: this,
      ),
    ];
    creditDebtCardList = [
      CreditDebtCardWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        creditDebtCardTypeEnum: creditDebtCardType.mastercard,
        height: creditDebtCardWidgetHeight,
      ),
      CreditDebtCardWidget(
        numericEnd: "5967",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "10/27",
        creditDebtCardTypeEnum: creditDebtCardType.visa,
        height: creditDebtCardWidgetHeight,
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

  previousAcademicRecordCard() async {
    await Future.delayed(Duration(milliseconds: 100));
    academicRecordCarouselController.previousPage();
  }

  nextAcademicRecordCard() async {
    await Future.delayed(Duration(milliseconds: 100));
    academicRecordCarouselController.nextPage();
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

  curriculumTabSelected(int curriculumIndexOfItem) async {
    await Future.delayed(Duration(milliseconds: 200));
    print("index: " + curriculumIndexOfItem.toString());
  }

  cardProfileSelected(int indexCardSelected) async {
    await Future.delayed(Duration(milliseconds: 200));
    print("index perfil: " + indexCardSelected.toString());
  }
}