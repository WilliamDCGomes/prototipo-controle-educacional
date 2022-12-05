import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/services/discipline_service.dart';
import 'package:projeto_tcc/base/services/grades_and_faults_service.dart';
import 'package:projeto_tcc/base/services/interfaces/idiscipline_service.dart';
import 'package:projeto_tcc/base/services/professor_service.dart';
import '../../../../../../base/models/discipline.dart';
import '../../../../../../base/models/grades_and_faults.dart';
import '../../../../../../base/services/interfaces/igrades_and_faults_service.dart';
import '../../../../../../base/services/interfaces/iprofessor_service.dart';
import '../../../../../utils/logged_user.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../../shared/widgets/widgetsAcademicInformations/discipline_card_tablet_phone_widget.dart';
import '../../shared/widgets/widgetsAcademicInformations/discipline_screen_tablet_phone_widget.dart';

class AcademicRecordTabletPhoneController extends GetxController {
  late String studentName;
  late String studentBirthday;
  late String studentRA;
  late String studentClass;
  late String studentCourse;
  late String studentStatus;
  late RxBool loadingAnimation;
  late Rx<DisciplineScreenTabletPhoneWidget> cardAcademicRecordTabletPhoneWidget;
  late TextEditingController searchDisciplineController;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late IGradesAndFaultsService _gradesAndFaultsService;
  late IDisciplineService _disciplioneService;
  late IProfessorService _professorService;

  AcademicRecordTabletPhoneController(){
    _inicializeVariables();
  }

  @override
  void onInit() async {
    await Future.delayed(Duration(milliseconds: 100));
    await _getAcademicRecord();
    super.onInit();
  }

  _inicializeVariables(){
    loadingAnimation = false.obs;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    studentName = LoggedUser.name.toUpperCase();
    studentBirthday = "30/01/1998";
    studentRA = LoggedUser.ra.toString();
    studentClass = "156-7A";
    studentCourse = LoggedUser.courseName;
    studentStatus = "MATRICULADO";
    searchDisciplineController = TextEditingController();
    cardAcademicRecordTabletPhoneWidget = DisciplineScreenTabletPhoneWidget(
      yearValueText: "2019",
      semesterValueText: "1º Semestre",
      academicRecordTabletPhoneController: this,
      disciplineCardList: [],
    ).obs;
    _gradesAndFaultsService = GradesAndFaultsService();
    _disciplioneService = DisciplineService();
    _professorService = ProfessorService();
  }

  _getAcademicRecord() async {
    try{
      await Future.delayed(Duration(milliseconds: 100));
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(seconds: 1));

      List<DisciplineCardTabletPhoneWidget> _disciplineCardTabletPhoneWidgetList = <DisciplineCardTabletPhoneWidget>[];

      List<GradesAndFaults> _gradesAndFaults = await _gradesAndFaultsService.getAllGradesAndFaults(
        LoggedUser.id,
        LoggedUser.courseId,
        LoggedUser.educationInstitutionId,
      );

      for(var gradeAndFaults in _gradesAndFaults){
        Discipline? discipline = await _disciplioneService.getDiscipline(gradeAndFaults.id_discipline, gradeAndFaults.educationInstitutionId, gradeAndFaults.courseId);

        if(discipline != null){
          discipline.name = await _disciplioneService.getDisciplineName(discipline.id);
        }
        else{
          continue;
        }

        _disciplineCardTabletPhoneWidgetList.add(
          DisciplineCardTabletPhoneWidget(
            disciplineName: discipline.name,
            disciplineWorkload: discipline.workload,
            firstFaults: gradeAndFaults.fault.first["faults"],
            secondFaults: gradeAndFaults.fault.last["faults"],
            firstNote: gradeAndFaults.grades.first["grade"] != null ? gradeAndFaults.grades.first["grade"] * 1.0 : null,
            secondNote: gradeAndFaults.grades.last["grade"] != null ? gradeAndFaults.grades.last["grade"] * 1.0 : null,
            classDuration: 100,
            semester: discipline.semester,
            professorDiscipline: await _professorService.getProfessorName(gradeAndFaults.id_professor),
          ),
        );
      }

      _disciplineCardTabletPhoneWidgetList.sort((a, b) => a.disciplineName.compareTo(b.disciplineName));
      _disciplineCardTabletPhoneWidgetList.sort((a, b) => a.semester.compareTo(b.semester));

      cardAcademicRecordTabletPhoneWidget.value = DisciplineScreenTabletPhoneWidget(
        yearValueText: LoggedUser.studentYear.toString(),
        semesterValueText: "${LoggedUser.semester}º Semestre",
        academicRecordTabletPhoneController: this,
        disciplineCardList: _disciplineCardTabletPhoneWidgetList,
      );

      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
    }
    catch(e){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro ao carregar as Histórico Acadêmico",
          );
        },
      );
      Get.back();
    }
  }
}