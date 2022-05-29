import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../academicRecord/page/academic_record_tablet_phone_page.dart';
import '../../shared/widgets/card_academic_record_widget.dart';
import '../../shared/widgets/card_main_menu_widget.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../widgets/componentTabWidget/card_tab_list_widget.dart';
import '../widgets/group_menu_home_widgets.dart';
import '../widgets/academic_tab_widget.dart';
import '../widgets/componentTabWidget/academic_tab_list_widget.dart';
import '../widgets/componentTabWidget/card_payment_list_widget.dart';
import '../widgets/componentTabWidget/card_profile_tab_list_widget.dart';
import '../widgets/financial_tab_widget.dart';
import '../widgets/home_tab_widget.dart';
import '../../academicCalendar/page/academic_calendar_tablet_phone_page.dart';
import '../../gradesFault/page/grades_faults_tablet_phone_page.dart';
import '../widgets/menu_options_widget.dart';
import '../widgets/profile_tab_widget.dart';
import '../../studentCard/page/student_card_tablet_phone_page.dart';
import '../../../../stylePages/app_colors.dart';

class MainMenuTabletPhoneController extends GetxController {
  late int activeStep;
  late int creditDebtCardActiveStep;
  late String nameInitials;
  late double creditDebtCardWidgetHeight;
  late RxBool hasPicture;
  late RxString courseName;
  late RxString welcomePhrase;
  late List<CardMainMenuWidget> cardMainMenuList;
  late List<GroupMenuHomeWidget> groupMenuHomeList;
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
    _initializeLists();
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
  }

  _initializeLists(){
    tabMainMenuList = [
      HomeTabWidget(controller: this),
      AcademicTabWidget(controller: this),
      FinancialTabWidget(controller: this),
      ProfileTabWidget(controller: this),
    ];
    groupMenuHomeList = [
      GroupMenuHomeWidget(
        titleGroupMenu:  "Ações Rápidas",
        menuOptionsList: [
          MenuOptionsWidget(
            text: "Notas e Faltas",
            imagePath: Paths.Icone_Notas_e_Faltas,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.gradesFaults),
          ),
          MenuOptionsWidget(
            text: "Calendário Acadêmico",
            imagePath: Paths.Icone_Calendario_Academico,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.academicCalendar),
          ),
          MenuOptionsWidget(
            text: "Carteirinha Online",
            imagePath: Paths.Icone_Carterinha_Estudante,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.onlineStudentCard),
          ),
          MenuOptionsWidget(
            text: "Histórico Acadêmico",
            imagePath: Paths.Icone_Historico_Academico,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.academicRecord),
          ),
          MenuOptionsWidget(
            text: "Notícias e Eventos",
            imagePath: Paths.Icone_Noticias_e_Eventos,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.newsEvents),
          ),
          SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),
        ],
      ),
      GroupMenuHomeWidget(
        titleGroupMenu:  "Solicitações",
        menuOptionsList: [
          MenuOptionsWidget(
            text: "Carteirinha de Estudante",
            imagePath: Paths.Icone_Carterinha_Estudante,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.studentCard),
          ),
          MenuOptionsWidget(
            text: "Declaração Escolar",
            imagePath: Paths.Icone_Declaracao_Escolar,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.schoolStatement),
          ),
          SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),
          SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),
        ],
      ),
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
        onTap: () async => await curriculumTabSelected(0),
      ),
      CardTabListWidget(
        firstValue: "Qualidade e Testes de Software",
        secondValue: "Segunda-Feira, 21:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await curriculumTabSelected(1),
      ),
      CardTabListWidget(
        firstValue: "Tópicos em Computação",
        secondValue: "Terça-Feira, 19:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await curriculumTabSelected(2),
      ),
      CardTabListWidget(
        firstValue: "Projeto I",
        secondValue: "Quarta-Feira, 19:00 - 20:40",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await curriculumTabSelected(3),
      ),
      CardTabListWidget(
        firstValue: "Segurança em Sistemas de Informação",
        secondValue: "Quarta-Feira, 21:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await curriculumTabSelected(4),
      ),
      CardTabListWidget(
        firstValue: "Ciência de Dados I",
        secondValue: "Quinta-Feira, 19:00 - 22:30",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await await curriculumTabSelected(5),
      ),
      CardTabListWidget(
        firstValue: "Modelagem Computacional em Grafos",
        secondValue: "Sexta-Feira, 19:00 - 20:40",
        thirdValue: "Laboratório A18",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await curriculumTabSelected(6),
      ),
      CardTabListWidget(
        firstValue: "Pesquisa Operacional",
        secondValue: "Sexta-Feira, 19:00 - 20:40",
        thirdValue: "Sala D14",
        cardColor: AppColors.purpleDefaultColor,
        onTap: () async => await curriculumTabSelected(7),
      ),
    ];
    deliveryTabList = [
      CardTabListWidget(
        firstValue: "Lista de Exercícios I",
        secondValue: "Segunda-Feira, 12/04 às 20:40",
        thirdValue: "Banco de Dados",
        cardColor: AppColors.orangeColor,
        onTap: () async => await cardProfileSelected(0),
      ),
      CardTabListWidget(
        firstValue: "Lista de Exercícios II",
        secondValue: "Quinta-Feira, 15/04 às 21:00",
        thirdValue: "Projeto I",
        cardColor: AppColors.orangeColor,
        onTap: () async => await cardProfileSelected(1),
      ),
      CardTabListWidget(
        firstValue: "Trabalho de Segurança",
        secondValue: "Quarta-Feira, 14/04 às 19:00",
        thirdValue: "Segurança de Sistema",
        cardColor: AppColors.orangeColor,
        onTap: () async => await cardProfileSelected(2),
      ),
      CardTabListWidget(
        firstValue: "Lista de Matemática",
        secondValue: "Sexta-Feira, 16/04 às 21:30",
        thirdValue: "Matemática",
        cardColor: AppColors.orangeColor,
        onTap: () async => await cardProfileSelected(3),
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
        titleIconPath: "Vincular SmartWatch",
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
        imagePath: "icone_notificacao.svg",
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
        fourthText: "7º Semestre",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "icone_notificacao.svg",
        firstText: "Próxima Aula",
        secondText: "Banco de Dados",
        thirdText: "19:00 às 20:50",
        fourthText: "25/04",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "icone_notificacao.svg",
        firstText: "Próxima Fatura",
        secondText: "R\$ 746,99",
        thirdText: "Vencimento: 05/06",
      ),
      CardMainMenuWidget(
        imagePath: "icone_notificacao.svg",
        firstText: "Próxima Prova",
        secondText: "Programação Orientada a Objetos",
        thirdText: "21:00 às 22:30",
        fourthText: "30/06",
        showSeparator: true,
      ),
      CardMainMenuWidget(
        imagePath: "icone_notificacao.svg",
        firstText: "Última nota postada",
        secondText: "Nota: 7,75",
        thirdText: "Segurança de Rede de Computadores",
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
      case quickActionsOptions.gradesFaults:
        Get.to(GradesFaultsTabletPhonePage());
        break;
      case quickActionsOptions.studentCard:
        break;
      case quickActionsOptions.onlineStudentCard:
        Get.to(StudentCardTabletPhonePage());
        break;
      case quickActionsOptions.academicCalendar:
        Get.to(AcademicCalendarTabletPhonePage());
        break;
      case quickActionsOptions.academicRecord:
        Get.to(AcademicRecordTabletPhonePage());
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