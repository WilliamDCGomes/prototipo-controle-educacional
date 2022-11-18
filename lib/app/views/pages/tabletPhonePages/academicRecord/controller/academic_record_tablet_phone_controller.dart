import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/logged_user.dart';
import '../../shared/widgets/widgetsAcademicInformations/discipline_card_tablet_phone_widget.dart';
import '../../shared/widgets/widgetsAcademicInformations/discipline_screen_tablet_phone_widget.dart';

class AcademicRecordTabletPhoneController extends GetxController {
  late String studentName;
  late String studentBirthday;
  late String studentRA;
  late String studentClass;
  late String studentCourse;
  late String studentStatus;
  late DisciplineScreenTabletPhoneWidget cardAcademicRecordTabletPhoneWidget;
  late TextEditingController searchDisciplineController;

  AcademicRecordTabletPhoneController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
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
      disciplineCardList: _getDisciplinesSemesterList(),
    );
  }

  List<DisciplineCardTabletPhoneWidget> _getDisciplinesSemesterList(){
    return [
      DisciplineCardTabletPhoneWidget(
        disciplineName: "Projeto I",
        disciplineWorkload: "40",
        firstFaults: 4,
        secondFaults: 5,
        classDuration: 200,
        professorDiscipline: "Torres",
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineName: "Ciência de Dados",
        disciplineWorkload: "56",
        firstFaults: 1,
        secondFaults: 1,
        classDuration: 200,
        professorDiscipline: "André Farina",
        firstNote: 5.8,
        secondNote: 9.4,
        approved: false,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineName: "Qualidade e Testes de Software",
        disciplineWorkload: "40",
        firstFaults: 1,
        secondFaults: 5,
        classDuration: 100,
        professorDiscipline: "Ivan",
        firstNote: 7.5,
        secondNote: 6.59,
        approved: true,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineName: "Modelagem Computacional em Grafos",
        disciplineWorkload: "56",
        firstFaults: 2,
        secondFaults: 3,
        classDuration: 200,
        professorDiscipline: "Leandro",
        firstNote: 7.96,
        secondNote: 4.96,
        approved: false,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineName: "Segurança em Sistemas de Informação",
        disciplineWorkload: "40",
        firstFaults: 0,
        secondFaults: 5,
        classDuration: 100,
        professorDiscipline: "Marco",
        firstNote: 9.85,
        secondNote: 7.52,
        approved: true,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineName: "Tópicos em Computação",
        disciplineWorkload: "54",
        firstFaults: 0,
        secondFaults: 0,
        classDuration: 100,
        professorDiscipline: "Torres",
        firstNote: 7.50,
        secondNote: 6.95,
        approved: true,
      ),
    ];
  }
}