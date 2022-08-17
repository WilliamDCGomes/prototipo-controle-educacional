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
        disciplineCode: "0215",
        disciplineName: "Projeto I",
        disciplineWorkload: "40",
        firstCardInformation: "8 faltas | 88,9% Frequência",
        professorDiscipline: "Torres",
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineCode: "0225",
        disciplineName: "Ciência de Dados",
        disciplineWorkload: "56",
        firstCardInformation: "2 faltas | 93,9% Frequência",
        professorDiscipline: "André Farina",
        firstNote: 5.8,
        secondNote: 9.4,
        approved: false,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineCode: "0456",
        disciplineName: "Qualidade e Testes de Software",
        disciplineWorkload: "40",
        firstCardInformation: "0 faltas | 100% Frequência",
        professorDiscipline: "Ivan",
        firstNote: 7.5,
        secondNote: 6.59,
        approved: true,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineCode: "0174",
        disciplineName: "Modelagem Computacional em Grafos",
        disciplineWorkload: "56",
        firstCardInformation: "5 faltas | 83,4% Frequência",
        professorDiscipline: "Leandro",
        firstNote: 7.96,
        secondNote: 4.96,
        approved: false,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineCode: "0189",
        disciplineName: "Segurança em Sistemas de Informação",
        disciplineWorkload: "40",
        firstCardInformation: "2 faltas | 96,9% Frequência",
        professorDiscipline: "Marco",
        firstNote: 9.85,
        secondNote: 7.52,
        approved: true,
      ),
      DisciplineCardTabletPhoneWidget(
        disciplineCode: "0172",
        disciplineName: "Tópicos em Computação",
        disciplineWorkload: "54",
        firstCardInformation: "6 faltas | 92,9% Frequência",
        professorDiscipline: "Torres",
        firstNote: 7.50,
        secondNote: 6.95,
        approved: true,
      ),
    ];
  }
}