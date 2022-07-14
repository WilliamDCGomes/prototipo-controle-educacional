import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../helpers/reorderer_lists.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_field_widget.dart';
import '../../../academicRecord/controller/academic_record_tablet_phone_controller.dart';
import '../../../academicRecord/widget/card_academic_student_record_tablet_phone_widget.dart';
import '../../../gradesFault/controller/grades_faults_tablet_phone_controller.dart';
import '../../../mainMenu/controller/main_menu_tablet_phone_controller.dart';
import '../card_academic_record_tablet_phone_widget.dart';
import 'discipline_card_tablet_phone_widget.dart';

class DisciplineScreenTabletPhoneWidget extends StatefulWidget {
  final String yearValueText;
  final String semesterValueText;
  final List<DisciplineCardTabletPhoneWidget> disciplineCardList;
  final GradesFaultsTabletPhoneController? gradesFaultsTabletPhoneController;
  final AcademicRecordTabletPhoneController? academicRecordTabletPhoneController;
  final MainMenuTabletPhoneController? mainMenuTabletPhoneController;

  const DisciplineScreenTabletPhoneWidget(
  { Key? key,
    required this.yearValueText,
    required this.semesterValueText,
    required this.disciplineCardList,
    this.gradesFaultsTabletPhoneController,
    this.academicRecordTabletPhoneController,
    this.mainMenuTabletPhoneController,
  }) : super(key: key);

  @override
  State<DisciplineScreenTabletPhoneWidget> createState() => _DisciplineScreenWidgetState();
}

class _DisciplineScreenWidgetState extends State<DisciplineScreenTabletPhoneWidget> {
  late TextEditingController searchDisciplineController;

  @override
  void initState() {
    searchDisciplineController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .5.w),
      child: Column(
        children: [
          Visibility(
            visible: widget.academicRecordTabletPhoneController != null,
            replacement: CardAcademicRecordTabletPhoneWidget(
              yearValueText: widget.yearValueText,
              semesterValueText: widget.semesterValueText,
              gradesFaultsTabletPhoneController: widget.gradesFaultsTabletPhoneController,
              mainMenuTabletPhoneController: widget.mainMenuTabletPhoneController,
            ),
            child: CardAcademicStudentRecordTabletPhoneWidget(
              academicRecordTabletPhoneController: widget.academicRecordTabletPhoneController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextFieldWidget(
              controller: searchDisciplineController,
              hintText: "Pesquise a Disciplina",
              height: 6.h,
              width: double.infinity,
              iconTextField: Icon(
                Icons.search,
                color: AppColors.purpleDefaultColor,
                size: 3.h,
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: SizedBox(
                width: double.infinity,
                child: ReorderableListView.builder(
                  itemCount: widget.disciplineCardList.length,
                  itemBuilder: (context, index){
                    return Container(
                      key: Key("$index"),
                      child: widget.disciplineCardList[index],
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    var newList = ReorderListHelper.reorderList(
                      oldIndex,
                      newIndex,
                      widget.disciplineCardList,
                    );
                    //TODO Fazer um método para salvar a nova lista
                  }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}