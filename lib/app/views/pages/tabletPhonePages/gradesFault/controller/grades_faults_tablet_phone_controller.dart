import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import 'package:projeto_tcc/base/models/grades_and_faults.dart';
import 'package:projeto_tcc/base/services/discipline_service.dart';
import 'package:projeto_tcc/base/services/grades_and_faults_service.dart';
import 'package:projeto_tcc/base/services/professor_service.dart';
import '../../../../../../base/models/discipline.dart';
import '../../../../../../base/services/interfaces/idiscipline_service.dart';
import '../../../../../../base/services/interfaces/igrades_and_faults_service.dart';
import '../../../../../../base/services/interfaces/iprofessor_service.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../../shared/widgets/widgetsAcademicInformations/discipline_card_tablet_phone_widget.dart';
import '../../shared/widgets/widgetsAcademicInformations/discipline_screen_tablet_phone_widget.dart';

class GradesFaultsTabletPhoneController extends GetxController {
  late RxBool loadingAnimation;
  late RxList<DisciplineScreenTabletPhoneWidget> cardAcademicRecordList;
  late CarouselController academicRecordCarouselController;
  late TextEditingController searchDisciplineController;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late IGradesAndFaultsService _gradesAndFaultsService;
  late IProfessorService _professorService;
  late IDisciplineService _disciplioneService;

  GradesFaultsTabletPhoneController(){
    _inicializeVariables();
  }

  @override
  void onInit() async {
    await Future.delayed(Duration(milliseconds: 100));
    await _getGradesAndFaults();
    super.onInit();
  }

  _inicializeVariables(){
    loadingAnimation = false.obs;
    cardAcademicRecordList = <DisciplineScreenTabletPhoneWidget>[].obs;
    searchDisciplineController = TextEditingController();
    academicRecordCarouselController = CarouselController();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    _gradesAndFaultsService = GradesAndFaultsService();
    _professorService = ProfessorService();
    _disciplioneService = DisciplineService();
  }

  _getGradesAndFaults() async {
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(seconds: 1));

      int yearSemester = DateTime.now().year;

      if(LoggedUser.studentYear > 1){
        yearSemester = yearSemester - LoggedUser.studentYear + 1;
      }

      for(int semester = 1; semester <= LoggedUser.semester; semester++){
        if(semester != 1 && semester % 2 == 1){
          yearSemester++;
        }

        cardAcademicRecordList.add(
          DisciplineScreenTabletPhoneWidget(
            yearValueText: yearSemester.toString(),
            semesterValueText: "$semesterº Semestre",
            gradesFaultsTabletPhoneController: this,
            disciplineCardList: await _getDisciplinesSemesterList(semester.toString()),
          ),
        );
      }
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
    }
    catch(e){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro ao carregar as Notas e Faltas",
          );
        },
      );
      Get.back();
    }
  }

  Future<List<DisciplineCardTabletPhoneWidget>> _getDisciplinesSemesterList(String semester) async {
    try{
      List<DisciplineCardTabletPhoneWidget> _disciplineCardTabletPhoneWidgetList = <DisciplineCardTabletPhoneWidget>[];
      List<GradesAndFaults> _gradesAndFaults = await _gradesAndFaultsService.getGradesAndFaults(
        LoggedUser.id,
        LoggedUser.courseId,
        LoggedUser.educationInstitutionId,
        semester,
      );

      for(var gradeAndFaults in _gradesAndFaults){
        Discipline? discipline = await _disciplioneService.getDiscipline(gradeAndFaults.id_discipline, gradeAndFaults.educationInstitutionId, gradeAndFaults.courseId);

        if(discipline != null){
          discipline.name = await _disciplioneService.getDisciplineName(discipline.id);
        }

        _disciplineCardTabletPhoneWidgetList.add(
          DisciplineCardTabletPhoneWidget(
            disciplineCode: "",
            disciplineName: discipline != null ? discipline.name : "",
            disciplineWorkload:  discipline != null ? discipline.workload : "",
            firstCardInformation: "${gradeAndFaults.fault} faltas | 88,9% Frequência",
            professorDiscipline: await _professorService.getProfessorName(gradeAndFaults.id_professor),
          ),
        );
      }

      return _disciplineCardTabletPhoneWidgetList;
    }
    catch(_){
      return [];
    }
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