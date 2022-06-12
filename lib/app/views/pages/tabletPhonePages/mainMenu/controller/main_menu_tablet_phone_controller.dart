import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/models/classes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/models/files.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../academicRecord/page/academic_record_tablet_phone_page.dart';
import '../../newsAndEvents/page/news_and_events_tablet_phone_page.dart';
import '../../shared/widgets/card_academic_record_widget.dart';
import '../../shared/widgets/card_main_menu_widget.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../../studentRequest/pages/student_request_tablet_phone_page.dart';
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
  late List<CurriculumDeliveryViewController> curriculumTabList;
  late List<CurriculumDeliveryViewController> deliveryTabList;
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
      CurriculumDeliveryViewController(
        title: "Projeto I",
        date: DateTime.now(),
        hourStart: "19:00",
        hourEnd: "20:40",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 02",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Qualidade e Testes de Software",
        date: DateTime.now(),
        hourStart: "21:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Tópicos em Computação",
        date: DateTime.now().add(Duration(days: 1)),
        hourStart: "19:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 02",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[],
          }),
          Classes.fromJson({
            "className": "Aula 03",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Projeto I",
        date: DateTime.now().add(Duration(days: 2)),
        hourStart: "19:00",
        hourEnd: "20:40",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [],
      ),
      CurriculumDeliveryViewController(
        title: "Segurança em Sistemas de Informação",
        date: DateTime.now().add(Duration(days: 2)),
        hourStart: "21:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 02",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Ciência de Dados I",
        date: DateTime.now().add(Duration(days: 3)),
        hourStart: "19:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 02",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Modelagem Computacional em Grafos",
        date: DateTime.now().add(Duration(days: 4)),
        hourStart: "19:00",
        hourEnd: "20:40",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 02",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 03",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 04",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Pesquisa Operacional",
        date: DateTime.now().add(Duration(days: 4)),
        hourStart: "21:00",
        hourEnd: "22:30",
        description: "Sala D14",
        color: AppColors.purpleDefaultColor,
        classes: [
          Classes.fromJson({
            "className": "Aula 01",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
          Classes.fromJson({
            "className": "Aula 02",
            "classSubject": "Raspagem de Dados",
            "disciplineName": "Projeto I",
            "classDescription": "Aula de projeto para concluir o TCC",
            "professorName": "Torres",
            "classDate": DateTime.now(),
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "active": true,
            "files": <Files>[
              Files.fromJson({
                "name": "Apresentação_da_Aula",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
              Files.fromJson({
                "name": "Lista_de_Exemplo",
                "type": "pdf",
                "byteArray": "teste",
                "lastChange": DateTime.now(),
                "includeDate": DateTime.now(),
                "lastSync": DateTime.now(),
                "active": true,
                "synced": true,
              }),
            ],
          }),
        ],
      ),
    ];

    deliveryTabList = [
      CurriculumDeliveryViewController(
        title: "Lista de Exercícios I",
        date: DateTime.now().add(Duration(days: 1)).add(Duration(hours: 5)),
        description: "Banco de Dados",
        color: AppColors.orangeColor,
      ),
      CurriculumDeliveryViewController(
        title: "Lista de Exercícios II",
        date: DateTime.now().add(Duration(days: 2)).add(Duration(hours: 2)),
        description: "Projeto I",
        color: AppColors.orangeColor,
      ),
      CurriculumDeliveryViewController(
        title: "Trabalho de Segurança",
        date: DateTime.now().add(Duration(days: 4)).add(Duration(hours: 3)),
        description: "Segurança de Sistema",
        color: AppColors.orangeColor,
      ),
      CurriculumDeliveryViewController(
        title: "Lista de Matemática",
        date: DateTime.now().add(Duration(days: 4)).add(Duration(hours: 5)),
        description: "Matemática",
        color: AppColors.orangeColor,
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
        Get.to(() => GradesFaultsTabletPhonePage());
        break;
      case quickActionsOptions.studentCard:
        Get.to(() => StudentRequestTablePhonePage(
          studentRequest: studentTypeRequest.studentCard,
        ));
        break;
      case quickActionsOptions.onlineStudentCard:
        Get.to(() => StudentCardTabletPhonePage());
        break;
      case quickActionsOptions.academicCalendar:
        Get.to(() => AcademicCalendarTabletPhonePage());
        break;
      case quickActionsOptions.academicRecord:
        Get.to(() => AcademicRecordTabletPhonePage());
        break;
      case quickActionsOptions.schoolStatement:
        Get.to(() => StudentRequestTablePhonePage(
          studentRequest: studentTypeRequest.schoolStatement,
        ));
        break;
      case quickActionsOptions.newsEvents:
        Get.to(() => NewsAndEventsTabletPhonePage());
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