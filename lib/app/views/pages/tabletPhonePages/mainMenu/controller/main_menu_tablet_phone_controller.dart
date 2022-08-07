import 'package:carousel_slider/carousel_controller.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/date_format_to_brazil.dart';
import 'package:projeto_tcc/base/models/classes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/models/files.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/platform_type.dart';
import '../../academicRecord/page/academic_record_tablet_phone_page.dart';
import '../../newsAndEvents/page/news_and_events_tablet_phone_page.dart';
import '../../shared/widgets/card_academic_record_tablet_phone_widget.dart';
import '../../shared/widgets/card_main_menu_tablet_phone_widget.dart';
import '../../shared/widgets/credit_debt_card_tablet_phone_widget.dart';
import '../../studentRequest/pages/student_request_tablet_phone_page.dart';
import '../../userProfile/page/user_profile_tablet_phone_page.dart';
import '../widgets/group_menu_home_tablet_phone_widgets.dart';
import '../widgets/academic_tab_tablet_phone_widget.dart';
import '../widgets/componentTabWidget/academic_tab_list_tablet_phone_widget.dart';
import '../widgets/componentTabWidget/card_profile_tab_list_tablet_phone_widget.dart';
import '../widgets/financial_tab_tablet_phone_widget.dart';
import '../widgets/home_tab_tablet_phone_widget.dart';
import '../../academicCalendar/page/academic_calendar_tablet_phone_page.dart';
import '../../gradesFault/page/grades_faults_tablet_phone_page.dart';
import '../widgets/menu_options_tablet_phone_widget.dart';
import '../widgets/profile_tab_tablet_phone_widget.dart';
import '../../studentCard/page/student_card_tablet_phone_page.dart';
import '../../../../stylePages/app_colors.dart';

class MainMenuTabletPhoneController extends GetxController {
  late int activeStep;
  late RxInt creditDebtCardActiveStep;
  late String nameInitials;
  late RxBool hasPicture;
  late RxBool deliveryTabSelected;
  late RxString courseName;
  late RxString welcomePhrase;
  late PaymentFinishedViewController nextBillToPay;
  late List<CardMainMenuTabletPhoneWidget> cardMainMenuList;
  late List<GroupMenuHomeTabletPhoneWidget> groupMenuHomeList;
  late List<CardProfileTabListTabletPhoneWidget> cardProfileTabList;
  late List<CreditDebtCardTabletPhoneWidget> creditDebtCardList;
  late List<CardAcademicRecordTabletPhoneWidget> cardAcademicRecordList;
  late List<CardPaymentViewController> cardPaymentList;
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
    deliveryTabSelected = false.obs;
    activeStep = 0;
    creditDebtCardActiveStep = 0.obs;
    carouselController = CarouselController();
    carouselCreditDebtCardController = CarouselController();
    academicRecordCarouselController = CarouselController();
    curriculumSearchController = TextEditingController();
    deliveriesSearchController = TextEditingController();
    nextBillToPay = PaymentFinishedViewController(
      "William Douglas Costa Gomes",
      "48467",
      "Mensalidade",
      "BANCO ITAÚ UNIBANCO S/A",
      "60.701.190/0001-04",
      "743,99",
      DateFormatToBrazil.formatDate(DateTime.now()),
      dueDate: "05/08/2022",
      statusText: "Aberta",
      hasCardRegistered: true,
    );
  }

  _initializeLists(){
    tabMainMenuList = [
      HomeTabTabletPhoneWidget(controller: this),
      AcademicTabTabletPhoneWidget(controller: this),
      FinancialTabTabletPhoneWidget(controller: this),
      ProfileTabTabletPhoneWidget(controller: this),
    ];
    groupMenuHomeList = [
      GroupMenuHomeTabletPhoneWidget(
        titleGroupMenu:  "Ações Rápidas",
        menuOptionsList: [
          MenuOptionsTabletPhoneWidget(
            text: "Notas e Faltas",
            imagePath: Paths.Icone_Notas_e_Faltas,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.gradesFaults),
          ),
          MenuOptionsTabletPhoneWidget(
            text: "Calendário Acadêmico",
            imagePath: Paths.Icone_Calendario_Academico,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.academicCalendar),
          ),
          MenuOptionsTabletPhoneWidget(
            text: "Carteirinha Online",
            imagePath: Paths.Icone_Carterinha_Estudante,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.onlineStudentCard),
          ),
          MenuOptionsTabletPhoneWidget(
            text: "Histórico Acadêmico",
            imagePath: Paths.Icone_Historico_Academico,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.academicRecord),
          ),
          MenuOptionsTabletPhoneWidget(
            text: "Notícias e Eventos",
            imagePath: Paths.Icone_Noticias_e_Eventos,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.newsEvents),
          ),
          SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),
        ],
      ),
      GroupMenuHomeTabletPhoneWidget(
        titleGroupMenu:  "Solicitações",
        menuOptionsList: [
          MenuOptionsTabletPhoneWidget(
            text: "Carteirinha de Estudante",
            imagePath: Paths.Icone_Carterinha_Estudante,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.studentCard),
          ),
          MenuOptionsTabletPhoneWidget(
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
      AcademicTabListTabletPhoneWidget(
        controller: this,
        academicTabType: academicTabs.curriculum,
      ),
      AcademicTabListTabletPhoneWidget(
        controller: this,
        academicTabType: academicTabs.deliveries,
      ),
    ];

    curriculumTabList = [
      CurriculumDeliveryViewController(
        title: "Projeto I",
        disciplineName: "Projeto I",
        date: DateTime.now(),
        hourStart: "19:00",
        hourEnd: "20:40",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        disciplineName: "Qualidade e Testes de Software",
        date: DateTime.now(),
        hourStart: "21:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        disciplineName: "Tópicos em Computação",
        date: DateTime.now().add(Duration(days: 1)),
        hourStart: "19:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        disciplineName: "Projeto I",
        date: DateTime.now().add(Duration(days: 2)),
        hourStart: "19:00",
        hourEnd: "20:40",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
        classes: [],
      ),
      CurriculumDeliveryViewController(
        title: "Segurança em Sistemas de Informação",
        disciplineName: "Segurança em Sistemas de Informação",
        date: DateTime.now().add(Duration(days: 2)),
        hourStart: "21:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        disciplineName: "Ciência de Dados I",
        date: DateTime.now().add(Duration(days: 3)),
        hourStart: "19:00",
        hourEnd: "22:30",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        disciplineName: "Modelagem Computacional em Grafos",
        date: DateTime.now().add(Duration(days: 4)),
        hourStart: "19:00",
        hourEnd: "20:40",
        description: "Laboratório A18",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        disciplineName: "Pesquisa Operacional",
        date: DateTime.now().add(Duration(days: 4)),
        hourStart: "21:00",
        hourEnd: "22:30",
        description: "Sala D14",
        color: AppColors.purpleDefaultColor,
        workDelivety: false,
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
        date: DateTime.now().add(Duration(days: 1)),
        hourStart: "20:40",
        disciplineName: "Banco de Dados",
        description: "Banco de Dados",
        color: AppColors.orangeColor,
        workDelivety: true,
        workDescription: "Para responder a esta lista de exercícios sobre Banco de dados, "
            "é fundamental saber o que é esse processo e as diferenças entre as fases "
            "de iniciação, alongamento e término.",
        workContent: <Files>[
          Files.fromJson({
            "name": "Lista_de_Exercícios",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
        workDelivery: <Files>[
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Lista de Exercícios II",
        date: DateTime.now().add(Duration(days: 2)),
        hourStart: "22:30",
        disciplineName: "Projeto I",
        description: "Projeto I",
        color: AppColors.orangeColor,
        workDelivety: true,
        workDescription: "Para responder a esta lista de exercícios sobre transcrição, "
            "é fundamental saber o que é esse processo e as diferenças entre as fases "
            "de iniciação, alongamento e término.",
        workContent: <Files>[
          Files.fromJson({
            "name": "Lista_de_Exercícios",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução_da_Aula_Passada",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
        workDelivery: <Files>[
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Trabalho de Segurança",
        date: DateTime.now().add(Duration(days: 4)),
        hourStart: "19:00",
        disciplineName: "Segurança de Sistema",
        description: "Segurança de Sistema",
        color: AppColors.orangeColor,
        workDelivety: true,
        workDescription: "Para responder a esta lista de exercícios sobre transcrição, "
            "é fundamental saber o que é esse processo e as diferenças entre as fases "
            "de iniciação, alongamento e término.",
        workContent: <Files>[
          Files.fromJson({
            "name": "Lista_de_Exercícios",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução_da_Aula_Passada",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
        workDelivery: <Files>[
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
      ),
      CurriculumDeliveryViewController(
        title: "Lista de Matemática",
        date: DateTime.now().add(Duration(days: 4)),
        hourStart: "20:40",
        disciplineName: "Matemática",
        description: "Matemática",
        color: AppColors.orangeColor,
        workDelivety: true,
        workDescription: "Para responder a esta lista de exercícios sobre Banco de dados, "
            "é fundamental saber o que é esse processo e as diferenças entre as fases "
            "de iniciação, alongamento e término.",
        workContent: <Files>[
          Files.fromJson({
            "name": "Lista_de_Exercícios",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Resolução_da_Aula_Passada",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
        workDelivery: <Files>[
          Files.fromJson({
            "name": "Resolução",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
          Files.fromJson({
            "name": "Desafio_proposto",
            "type": "pdf",
            "byteArray": "teste",
            "lastChange": DateTime.now(),
            "includeDate": DateTime.now(),
            "lastSync": DateTime.now(),
            "active": true,
            "synced": true,
          }),
        ],
      ),
    ];

    cardPaymentList = [
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "04/07/2022",
        "05/07/2022",
        "743,99",
        paymentStatus.finished,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/08/2022",
        "743,99",
        paymentStatus.late,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/09/2022",
        "743,99",
        paymentStatus.next,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/10/2022",
        "743,99",
        paymentStatus.future,
      ),
    ];

    cardProfileTabList = [
      CardProfileTabListTabletPhoneWidget(
        iconCard: SvgPicture.asset(
          Paths.Icone_Noticias_e_Eventos,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Notícias e Eventos",
        page: destinationsPages.newsAndEvents,
      ),
      // CardProfileTabListWidget(
      //   iconCard: Icon(
      //     Icons.settings,
      //     color: AppColors.purpleDefaultColor,
      //     size: 5.h,
      //   ),
      //   titleIconPath: "Configurações",
      //   page: destinationsPages.settings,
      // ),
      CardProfileTabListTabletPhoneWidget(
        iconCard: SvgPicture.asset(
          Paths.Icone_Redefinir_Senha,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Redefinir Senha",
        page: destinationsPages.resetPassword,
      ),
      CardProfileTabListTabletPhoneWidget(
        iconCard: Icon(
          Icons.qr_code_scanner,
          color: AppColors.purpleDefaultColor,
          size: 5.h,
        ),
        titleIconPath: "Vincular SmartWatch",
        page: destinationsPages.connectToSmartWatch,
      ),
      CardProfileTabListTabletPhoneWidget(
        iconCard: SvgPicture.asset(
          Paths.Icone_Sair,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Sair",
        page: destinationsPages.logout,
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
      CardMainMenuTabletPhoneWidget(
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
        fourthText: "7º Semestre",
        showSeparator: true,
      ),
      CardMainMenuTabletPhoneWidget(
        firstText: "Próxima Aula",
        secondText: "Banco de Dados",
        thirdText: "19:00 às 20:50",
        fourthText: "25/04",
        showSeparator: true,
      ),
      CardMainMenuTabletPhoneWidget(
        firstText: "Próxima Fatura",
        secondText: "R\$ 746,99",
        thirdText: "Vencimento: 05/06",
      ),
      CardMainMenuTabletPhoneWidget(
        firstText: "Próxima Prova",
        secondText: "Programação Orientada a Objetos",
        thirdText: "21:00 às 22:30",
        fourthText: "30/06",
        showSeparator: true,
      ),
      CardMainMenuTabletPhoneWidget(
        firstText: "Última nota postada",
        secondText: "Nota: 7,75",
        thirdText: "Segurança de Rede de Computadores",
      ),
    ];

    cardAcademicRecordList = [
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2019",
        semesterValueText: "1º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2019",
        semesterValueText: "2º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2020",
        semesterValueText: "3º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2020",
        semesterValueText: "4º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2021",
        semesterValueText: "5º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2021",
        semesterValueText: "6º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2022",
        semesterValueText: "7º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
      CardAcademicRecordTabletPhoneWidget(
        yearValueText: "2022",
        semesterValueText: "8º Semestre",
        mainMenuTabletPhoneController: this,
        iconPath: Paths.Icone_Exibicao_Academico,
      ),
    ];

    creditDebtCardList = [
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.mastercard,
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.elo,
        creditDebtCardTypeEnum: creditDebtCardType.credit,
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
    Get.to(() => UserProfileTablePhonePage());
  }

  openConfiguration() async {

  }

  previousAcademicRecordCard() async {
    academicRecordCarouselController.previousPage();
  }

  nextAcademicRecordCard() async {
    academicRecordCarouselController.nextPage();
  }

  quickActionsClicked(quickActionsOptions chosenOption) async {
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
}