import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/grades_faults_controller.dart';
import '../../../../controllers/main_menu_tablet_phone_controller.dart';
import '../../../stylePages/app_colors.dart';
import '../../text_field_widget.dart';
import '../card_academic_record_widget.dart';
import 'discipline_card_widget.dart';

class DisciplineScreenWidget extends StatefulWidget {
  final String yearValueText;
  final String semesterValueText;
  final List<DisciplineCardWidget> disciplineCardList;
  final GradesFaultsController? gadesFaultsController;
  final MainMenuTabletPhoneController? mainMenuTabletPhoneController;
  const DisciplineScreenWidget(
  { Key? key,
    required this.yearValueText,
    required this.semesterValueText,
    required this.disciplineCardList,
    this.gadesFaultsController,
    this.mainMenuTabletPhoneController,
  }) : super(key: key);

  @override
  State<DisciplineScreenWidget> createState() => _DisciplineScreenWidgetState();
}

class _DisciplineScreenWidgetState extends State<DisciplineScreenWidget> {
  late TextEditingController searchDisciplineController;

  @override
  void initState() {
    searchDisciplineController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardAcademicRecordWidget(
          yearValueText: widget.yearValueText,
          semesterValueText: widget.semesterValueText,
          gadesFaultsController: widget.gadesFaultsController,
          mainMenuTabletPhoneController: widget.mainMenuTabletPhoneController,
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: TextFieldWidget(
            controller: searchDisciplineController,
            hintText: "Pesquise a Disciplina",
            height: 6.h,
            width: 90.w,
            iconTextField: Icon(
              Icons.search,
              color: AppColors.purpleDefaultColor,
            ),
            keyboardType: TextInputType.name,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: SizedBox(
              width: 90.w,
              child: ListView.builder(
                itemCount: widget.disciplineCardList.length,
                itemBuilder: (context, index){
                  return widget.disciplineCardList[index];
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}