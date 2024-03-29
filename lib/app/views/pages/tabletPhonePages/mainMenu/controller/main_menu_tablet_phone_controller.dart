import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/utils/format_hours.dart';
import 'package:projeto_tcc/base/services/discipline_service.dart';
import '../../../../../../base/models/discipline.dart';
import '../../../../../../base/services/interfaces/idiscipline_service.dart';
import '../../../../../../base/services/interfaces/ionline_student_card_service.dart';
import '../../../../../../base/services/online_student_card_service.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/get_profile_picture_controller.dart';
import '../../../../../utils/paths.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../../utils/logged_user.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../../../base/models/files.dart';
import 'package:projeto_tcc/base/models/user.dart';
import '../../../../../../base/models/student.dart';
import 'package:projeto_tcc/base/models/classes.dart';
import '../widgets/home_tab_tablet_phone_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/profile_tab_tablet_phone_widget.dart';
import '../widgets/academic_tab_tablet_phone_widget.dart';
import 'package:carousel_slider/carousel_controller.dart';
import '../widgets/menu_options_tablet_phone_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
import '../widgets/group_menu_home_tablet_phone_widgets.dart';
import 'package:projeto_tcc/base/services/course_service.dart';
import 'package:projeto_tcc/app/utils/internet_connection.dart';
import 'package:projeto_tcc/base/services/student_service.dart';
import '../../shared/popups/confirmation_tablet_phone_popup.dart';
import 'package:projeto_tcc/app/utils/date_format_to_brazil.dart';
import '../../studentCard/page/student_card_tablet_phone_page.dart';
import '../../userProfile/page/user_profile_tablet_phone_page.dart';
import '../../gradesFault/page/grades_faults_tablet_phone_page.dart';
import '../../shared/widgets/card_main_menu_tablet_phone_widget.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../shared/widgets/credit_debt_card_tablet_phone_widget.dart';
import '../../../../../../base/services/interfaces/icourse_service.dart';
import '../../newsAndEvents/page/news_and_events_tablet_phone_page.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import '../../academicRecord/page/academic_record_tablet_phone_page.dart';
import '../../../../../../base/services/interfaces/istudent_service.dart';
import '../../studentRequest/pages/student_request_tablet_phone_page.dart';
import '../../shared/widgets/card_academic_record_tablet_phone_widget.dart';
import 'package:projeto_tcc/base/services/itens_orders_by_user_service.dart';
import '../../academicCalendar/page/academic_calendar_tablet_phone_page.dart';
import 'package:projeto_tcc/base/services/education_institution_service.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../widgets/componentTabWidget/academic_tab_list_tablet_phone_widget.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../widgets/componentTabWidget/card_profile_tab_list_tablet_phone_widget.dart';
import '../../../../../../base/services/interfaces/iitens_orders_by_user_service.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import 'package:projeto_tcc/base/services/interfaces/ieducation_institution_service.dart';

class MainMenuTabletPhoneController extends GetxController {
  late int activeStep;
  late bool firstRegister;
  late RxInt creditDebtCardActiveStep;
  late RxBool isLoadingMainMenu;
  late RxBool hasPicture;
  late RxBool deliveryTabSelected;
  late RxBool loadingPicture;
  late RxString nameInitials;
  late RxString nameProfile;
  late RxString courseName;
  late RxString welcomePhrase;
  late RxString profileImagePath;
  late PaymentFinishedViewController nextBillToPay;
  late List<Discipline> disciplines;
  late List<Discipline> disciplinesFromActualSemester;
  late List<CardProfileTabListTabletPhoneWidget> cardProfileTabList;
  late List<CardPaymentViewController> cardPaymentList;
  late List<CurriculumDeliveryViewController> curriculumTabList;
  late List<CurriculumDeliveryViewController> deliveryTabList;
  late List<Widget> tabMainMenuList;
  late List<Widget> tabAcademicRecordList;
  late RxList<CardMainMenuTabletPhoneWidget> cardMainMenuList;
  late RxList<CardAcademicRecordTabletPhoneWidget> cardAcademicRecordList;
  late RxList<CreditDebtCardTabletPhoneWidget> creditDebtCardList;
  late RxList<GroupMenuHomeTabletPhoneWidget> groupMenuHomeList;
  late RxList<MenuOptionsTabletPhoneWidget> quickItemsList;
  late RxList<MenuOptionsTabletPhoneWidget> requestItemsList;
  late TabController tabController;
  late TabController tabAcademicController;
  late TabController tabFinancialController;
  late CarouselController carouselController;
  late CarouselController carouselCreditDebtCardController;
  late CarouselController academicRecordCarouselController;
  late TextEditingController curriculumSearchController;
  late TextEditingController deliveriesSearchController;
  late SharedPreferences sharedPreferences;
  late Student? student;
  late Users? user;
  late IStudentService studentService;
  late IUserService userService;
  late ICourseService courseService;
  late IEducationInstitutionService educationInstitutionService;
  late IItensOrderByUserService itensOrderByUserService;
  late IOnlineStudentCardService _onlineStudentCardService;
  late IDisciplineService _disciplineService;
  static const String quick_buttons = "quick_buttons";
  static const String request_buttons = "request_buttons";
  static const String group_menu = "group_menu";

  MainMenuTabletPhoneController(){
    _initializeVariables();
    _initializeLists();
    _getWelcomePhrase();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await _getUserLogged();
    _getValues();
    await GetProfilePictureController.loadProfilePicture(
      loadingPicture,
      hasPicture,
      profileImagePath,
      userService,
    );
    await _getCourseName();
    await _getEducationInstitutionName();
    await _getDisciplinesOfCourse();
    await _loadCards();
    await _getListOrderByUser();
    await _checkFingerPrintUser();
    isLoadingMainMenu.value = false;
    _getDisciplinesName();
    super.onInit();
  }

  _initializeVariables(){
    firstRegister = true;
    nameProfile = "".obs;
    nameInitials = "".obs;
    profileImagePath = "".obs;
    isLoadingMainMenu = true.obs;
    hasPicture = false.obs;
    loadingPicture = true.obs;
    deliveryTabSelected = false.obs;
    activeStep = 0;
    creditDebtCardActiveStep = 0.obs;
    carouselController = CarouselController();
    carouselCreditDebtCardController = CarouselController();
    academicRecordCarouselController = CarouselController();
    curriculumSearchController = TextEditingController();
    deliveriesSearchController = TextEditingController();
    nextBillToPay = PaymentFinishedViewController(
      LoggedUser.name,
      LoggedUser.ra.toString(),
      "Mensalidade",
      "BANCO ITAÚ UNIBANCO S/A",
      "60.701.190/0001-04",
      "743,99",
      DateFormatToBrazil.formatDate(DateTime.now()),
      dueDate: "05/08/2022",
      statusText: "Aberta",
      hasCardRegistered: true,
    );
    studentService = StudentService();
    userService = UserService();
    courseService = CourseService();
    educationInstitutionService = EducationInstitutionService();
    itensOrderByUserService = ItensOrderByUserService();
    _onlineStudentCardService = OnlineStudentCardService();
    _disciplineService = DisciplineService();
  }

  _initializeLists(){
    tabMainMenuList = [
      HomeTabTabletPhoneWidget(controller: this),
      AcademicTabTabletPhoneWidget(controller: this),
      //FinancialTabTabletPhoneWidget(controller: this),
      ProfileTabTabletPhoneWidget(controller: this),
    ];
    disciplines = <Discipline>[];
    disciplinesFromActualSemester = <Discipline>[];
    groupMenuHomeList = <GroupMenuHomeTabletPhoneWidget>[].obs;
    quickItemsList = <MenuOptionsTabletPhoneWidget>[].obs;
    requestItemsList = <MenuOptionsTabletPhoneWidget>[].obs;

    cardMainMenuList = <CardMainMenuTabletPhoneWidget>[].obs;
    cardAcademicRecordList = <CardAcademicRecordTabletPhoneWidget>[].obs;
    creditDebtCardList = <CreditDebtCardTabletPhoneWidget>[].obs;

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
        LoggedUser.name,
        LoggedUser.ra.toString(),
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "04/07/2022",
        "05/07/2022",
        "743,99",
        paymentStatus.finished,
      ),
      CardPaymentViewController(
        LoggedUser.name,
        LoggedUser.ra.toString(),
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/08/2022",
        "743,99",
        paymentStatus.late,
      ),
      CardPaymentViewController(
        LoggedUser.name,
        LoggedUser.ra.toString(),
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/09/2022",
        "743,99",
        paymentStatus.next,
      ),
      CardPaymentViewController(
        LoggedUser.name,
        LoggedUser.ra.toString(),
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
      CardProfileTabListTabletPhoneWidget(
        iconCard: Image.asset(
          Paths.Icone_Configuracao_Menu,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Configurações",
        page: destinationsPages.settings,
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

  _getUserLogged() async {
    try{
      int? ra = await sharedPreferences.getInt("ra_student_logged");
      if(ra != null) {
        student = await studentService.getStudent(ra);
        if(student != null){
          LoggedUser.ra = student!.ra;
          LoggedUser.bimester = student!.bimester;
          LoggedUser.semester = student!.semester;
          LoggedUser.studentYear = student!.studentYear;
          LoggedUser.educationInstitutionId = student!.educationInstitutionId;
          LoggedUser.courseId = student!.courseId;
          LoggedUser.period = student!.period;
          LoggedUser.id = student!.id;
          LoggedUser.includeDate = student!.includeDate;

          user = await userService.getUser(student!.cpf);

          if(user != null){
            LoggedUser.name = user!.name;
            LoggedUser.birthdate = user!.birthdate;
            LoggedUser.cpf = user!.cpf;
            LoggedUser.gender = user!.gender;
            LoggedUser.cep = user!.cep;
            LoggedUser.uf = user!.uf;
            LoggedUser.city = user!.city;
            LoggedUser.street = user!.street;
            LoggedUser.houseNumber = user!.houseNumber;
            LoggedUser.neighborhood = user!.neighborhood;
            LoggedUser.complement = user!.complement;
            LoggedUser.phone = user!.phone;
            LoggedUser.cellPhone = user!.cellPhone;
            LoggedUser.email = user!.email;
          }
        }
      }
    }
    catch(_){

    }
  }

  _getCourseName() async {
    try{
      LoggedUser.courseName = await courseService.getCourseNameById(LoggedUser.courseId);
    }
    catch(_){

    }
  }

  _getDisciplinesOfCourse() async {
    try{
      disciplines = await _disciplineService.getDisciplines(
        LoggedUser.educationInstitutionId,
        LoggedUser.courseId,
        LoggedUser.period,
      );

      for(var discipline in disciplines){
        if(discipline.semester == LoggedUser.semester.toString()){
          disciplinesFromActualSemester.add(discipline);
        }
      }
    }
    catch(_){

    }
  }

  _getDisciplinesName() async {
    try{
      for(var discipline in disciplines){
        if(discipline.name == ""){
          discipline.name = await _disciplineService.getDisciplineName(discipline.id);
        }
      }
    }
    catch(_){

    }
  }

  _getEducationInstitutionName() async {
    try{
      LoggedUser.educationInstitutionName = await  educationInstitutionService.getEducationInstitutionNameById(LoggedUser.educationInstitutionId);
    }
    catch(_){

    }
  }

  _getListOrderByUser() async {
    try{
      Map<String, dynamic>? items = null;
      if(await InternetConnection.checkConnection()){
        items = await itensOrderByUserService.getOrderLists(LoggedUser.cpf);
        if(items != null){
          List<Map<String, dynamic>> groupMenuList = <Map<String, dynamic>>[];
          List<Map<String, dynamic>> quickButtonsList = <Map<String, dynamic>>[];
          List<Map<String, dynamic>> requestButtonList = <Map<String, dynamic>>[];

          items[group_menu].forEach((element) => groupMenuList.add(element));
          items[quick_buttons].forEach((element) => quickButtonsList.add(element));
          items[request_buttons].forEach((element) => requestButtonList.add(element));

          await _loadListMenu(quickButtonsList);
          await _loadListMenu(requestButtonList);
          await _loadListMenu(groupMenuList);

          await _saveListMenu(quick_buttons, quickButtonsList);
          await _saveListMenu(request_buttons, requestButtonList);
          await _saveListMenu(group_menu, groupMenuList);
        }
      }
      if(items == null){
        await _loadListMenuWithoutInternet(quick_buttons);
        await _loadListMenuWithoutInternet(request_buttons);
        await _loadListMenuWithoutInternet(group_menu);
      }
    }
    catch(_){

    }
  }

  _saveListMenu(String key, List<Map<String, dynamic>> items) async {
    try{
      List<String> orderList = <String>[];
      for(var item in items) {
        if (item["visible"]) {
          orderList.add(item["id"]);
        }
      }
      await sharedPreferences.setStringList(key, orderList);
    }
    catch(_){

    }
  }

  updateListOfflineAndOnline(String key, List<String> items) async {
    try{
      if(key == "quick_actions_id"){
        key = quick_buttons;
      }
      else if(key == "request_id"){
        key = request_buttons;
      }
      await sharedPreferences.setStringList(key, items);


      var oldItems = await itensOrderByUserService.getOrderLists(LoggedUser.cpf);

      if(oldItems != null){
        List<Map<String, dynamic>> newItems = <Map<String, dynamic>>[];

        for(var item in items){
          for(var element in oldItems[key]){
            if(element["id"] == item){
              newItems.add(element);
              break;
            }
          }
        }
        await itensOrderByUserService.updateOrderLists(
          LoggedUser.cpf,
          key,
          newItems,
        );
      }
    }
    catch(_){

    }
  }

  _loadListMenuWithoutInternet(String key) async {
    try{
      var orderList = await sharedPreferences.getStringList(key);
      if(orderList != null){
        for(var item in orderList) {
          await _setList(item);
        }
      }
      else{
        List<String> list = <String>[];
        switch(key){
          case quick_buttons:
            list = [
              "grades_faults_id",
              "academic_calendar_id",
              "online_student_card_id",
              "academic_record_id",
              "news_events_id",
            ];
            break;
          case request_buttons:
            list = [
              "student_card_id",
              "school_statement_id",
              "substitute_exam_id",
            ];
            break;
          case group_menu:
            list = [
              "quick_actions_id",
              "request_id",
            ];
            break;
        }

        list.forEach((element) async => await _setList(element));

        await sharedPreferences.setStringList(
          key,
          list,
        );

        _insertListInFirebase(key, list);
      }
    }
    catch(_){

    }
  }

  _insertListInFirebase(String key, List<String> list) async {
    try{
      List<Map<String, dynamic>> newList = <Map<String, dynamic>>[];
      for(var item in list){
        newList.add(
          {
            "id": item,
            "visible": true,
          }
        );
      }
      if(firstRegister){
        firstRegister = false;
        await itensOrderByUserService.insertOrderLists(
          LoggedUser.cpf,
          key,
          newList,
        );
      }
      else {
        await itensOrderByUserService.updateOrderLists(
          LoggedUser.cpf,
          key,
          newList,
        );
      }
    }
    catch(_){

    }
  }

  _loadListMenu(List<Map<String, dynamic>> items) async {
    try{
      for(var item in items){
        if(item["visible"]){
          await _setList(item["id"]);
        }
      }
    }
    catch(_){

    }
  }

  _setList(String key) async {
    switch(key){
      case "quick_actions_id":
        List<Widget> requestList = <Widget>[];
        requestList.addAll(quickItemsList);
        while(true){
          if(requestList.length % 4 != 0){
            requestList.add(SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),);
            continue;
          }
          break;
        }
        groupMenuHomeList.add(
          GroupMenuHomeTabletPhoneWidget(
            groupMenuId: "quick_actions_id",
            titleGroupMenu:  "Ações Rápidas",
            menuOptionsList: requestList,
            mainMenuTabletPhoneController: this,
          ),
        );
        break;
      case "request_id":
        List<Widget> requestList = <Widget>[];
        requestList.addAll(requestItemsList);
        while(true){
          if(requestList.length % 4 != 0){
            requestList.add(SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),);
            continue;
          }
          break;
        }

        groupMenuHomeList.add(
          GroupMenuHomeTabletPhoneWidget(
            groupMenuId: "request_id",
            titleGroupMenu:  "Solicitações",
            menuOptionsList: requestList,
            mainMenuTabletPhoneController: this,
          ),
        );
        break;
      case "grades_faults_id":
        quickItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "grades_faults_id",
            text: "Notas e Faltas",
            imagePath: Paths.Icone_Notas_e_Faltas,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.gradesFaults),
          ),
        );
        break;
      case "academic_calendar_id":
        quickItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "academic_calendar_id",
            text: "Calendário Acadêmico",
            imagePath: Paths.Icone_Calendario_Academico,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.academicCalendar),
          ),
        );
        break;
      case "online_student_card_id":
        if(await _onlineStudentCardService.checkOnlineStudentCardExist()){
          quickItemsList.add(
            MenuOptionsTabletPhoneWidget(
              id_option: "online_student_card_id",
              text: "Carteirinha Online",
              imagePath: Paths.Icone_Carterinha_Estudante,
              textColor: AppColors.blackColor,
              onTap: () => quickActionsClicked(quickActionsOptions.onlineStudentCard),
            ),
          );
        }
        break;
      case "academic_record_id":
        quickItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "academic_record_id",
            text: "Histórico Acadêmico",
            imagePath: Paths.Icone_Historico_Academico,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.academicRecord),
          ),
        );
        break;
      case "news_events_id":
        quickItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "news_events_id",
            text: "Notícias e Eventos",
            imagePath: Paths.Icone_Noticias_e_Eventos,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.newsEvents),
          ),
        );
        break;
      case "student_card_id":
        requestItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "student_card_id",
            text: "Carteirinha de Estudante",
            imagePath: Paths.Icone_Carterinha_Estudante,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.studentCard),
          ),
        );
        break;
      case "school_statement_id":
        requestItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "school_statement_id",
            text: "Declaração Escolar",
            imagePath: Paths.Icone_Declaracao_Escolar,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.schoolStatement),
          ),
        );
        break;
      case "substitute_exam_id":
        requestItemsList.add(
          MenuOptionsTabletPhoneWidget(
            id_option: "substitute_exam_id",
            text: "Prova Substitutiva",
            imagePath: Paths.Solicitacao_Segunda_Chamada_Menu,
            textColor: AppColors.blackColor,
            onTap: () => quickActionsClicked(quickActionsOptions.substituteExam),
          ),
        );
        break;
    }
  }

  _getValues(){
    var names = LoggedUser.name.trim().split(" ");

    if(names.isNotEmpty && names.first != ""){
      nameProfile.value = names[0];
      LoggedUser.nameAndLastName = names[0];
      nameInitials.value = nameProfile.value[0];
      if(names.length > 1 && names.last != ""){
        nameInitials.value += names.last[0];
        LoggedUser.nameAndLastName += " ${names.last}";
      }
      LoggedUser.nameInitials = nameInitials.value;
    }

    courseName = LoggedUser.courseName.obs;
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

  _loadCards() async {
    cardMainMenuList.value = [
      CardMainMenuTabletPhoneWidget(
        firstText: "Meu Painel",
        secondText: LoggedUser.courseName,
        thirdText: "${LoggedUser.studentYear}º Ano",
        fourthText: "${LoggedUser.semester}º Semestre",
        showSeparator: true,
      ),
    ];

    await _getActualNextClass();

    cardMainMenuList.add(
      CardMainMenuTabletPhoneWidget(
        firstText: "Próxima Fatura",
        secondText: "R\$ 746,99",
        thirdText: "Vencimento: 05/06",
      ),
    );

    cardMainMenuList.add(
      CardMainMenuTabletPhoneWidget(
        firstText: "Próxima Prova",
        secondText: "Programação Orientada a Objetos",
        thirdText: "21:00 às 22:30",
        fourthText: "30/06",
        showSeparator: true,
      ),
    );

    cardMainMenuList.add(
      CardMainMenuTabletPhoneWidget(
        firstText: "Última nota postada",
        secondText: "Nota: 7,75",
        thirdText: "Segurança de Rede de Computadores",
      ),
    );

    cardAcademicRecordList.value = [
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

    creditDebtCardList.value = [
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: LoggedUser.name,
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.mastercard,
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: LoggedUser.name,
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.elo,
        creditDebtCardTypeEnum: creditDebtCardType.credit,
      ),
    ];
  }

  _getActualNextClass() async {
    List<Discipline> disciplesOfTheDay = _getNextClass();
    if(disciplesOfTheDay.isNotEmpty){
      for(var discipline in disciplesOfTheDay){
        int hoursBegin = FormatHours.formatHourStringToMinuteInt(discipline.disciplinesPeriod.first.start_hour);
        int hoursEnd = FormatHours.formatHourStringToMinuteInt(discipline.disciplinesPeriod.first.end_hour);
        DateTime hour = DateTime.now();
        int actualHour = ((hour.hour * 60) + hour.minute);
        if(actualHour < hoursBegin){
          discipline.name = await _disciplineService.getDisciplineName(discipline.id);
          cardMainMenuList.add(
            CardMainMenuTabletPhoneWidget(
              firstText: "Próxima Aula",
              secondText: discipline.name,
              thirdText: FormatHours.hourToHour(
                discipline.disciplinesPeriod.first.start_hour,
                discipline.disciplinesPeriod.first.end_hour,
              ),
              fourthText: DateFormatToBrazil.dayAndMounth(hour),
              showSeparator: true,
            ),
          );
          break;
        }
        else if(actualHour <= hoursEnd){
          discipline.name = await _disciplineService.getDisciplineName(discipline.id);
          cardMainMenuList.add(
            CardMainMenuTabletPhoneWidget(
              firstText: "Aula Atual",
              secondText: discipline.name,
              thirdText: FormatHours.hourToHour(
                discipline.disciplinesPeriod.first.start_hour,
                discipline.disciplinesPeriod.first.end_hour,
              ),
              fourthText: DateFormatToBrazil.dayAndMounth(hour),
              showSeparator: true,
            ),
          );
          break;
        }
      }
    }
  }

  List<Discipline> _getNextClass(){
    List<Discipline> disciplinesOfTheDay = <Discipline>[];

    for(var discipline in disciplinesFromActualSemester){
      for(var periods in discipline.disciplinesPeriod){
        switch(DateTime.now().weekday){
          case DateTime.monday:
            if(periods.day == "Segunda-Feira"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
          case DateTime.tuesday:
            if(periods.day == "Terça-Feira"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
          case DateTime.wednesday:
            if(periods.day == "Quarta-Feira"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
          case DateTime.thursday:
            if(periods.day == "Quinta-Feira"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
          case DateTime.friday:
            if(periods.day == "Sexta-Feira"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
          case DateTime.saturday:
            if(periods.day == "Sábado"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
          case DateTime.sunday:
            if(periods.day == "Domingo"){
              disciplinesOfTheDay.add(discipline);
            }
            break;
        }
      }
    }

    return disciplinesOfTheDay;
  }

  _checkFingerPrintUser() async {
    bool? useFingerPrint = await sharedPreferences.getBool("user_finger_print");
    if(useFingerPrint == null && await LocalAuthentication().canCheckBiometrics){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ConfirmationTabletPhonePopup(
            title: "Aviso",
            subTitle: "Deseja habilitar o login por digital?",
            firstButton: () => sharedPreferences.setBool("user_finger_print", false),
            secondButton: () => sharedPreferences.setBool("user_finger_print", true),
          );
        },
      );
    }
  }

  openProfile() async {
    Get.to(() => UserProfileTablePhonePage(mainMenuController: this,));
  }

  refreshProfilePicture() async {
    await Future.delayed(Duration(seconds: 2));
    await GetProfilePictureController.loadProfilePicture(
      loadingPicture,
      hasPicture,
      profileImagePath,
      userService,
    );
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
      case quickActionsOptions.substituteExam:
        Get.to(() => StudentRequestTablePhonePage(
          studentRequest: studentTypeRequest.substituteExam,
        ));
        break;
      case quickActionsOptions.newsEvents:
        Get.to(() => NewsAndEventsTabletPhonePage());
        break;
    }
  }
}