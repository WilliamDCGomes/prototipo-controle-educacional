import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/get_status_academic_icon.dart';
import '../../../../../../utils/logged_user.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../../widgetsShared/text_widget.dart';

class DisciplineBodyCardTabletPhoneWidget extends StatelessWidget {
  final int firstFaults;
  final int secondFaults;
  final String disciplineWorkload;
  final String noteAverage;
  final int classDuration;
  final bool? approved;

  const DisciplineBodyCardTabletPhoneWidget(
      { Key? key,
        required this.firstFaults,
        required this.secondFaults,
        required this.disciplineWorkload,
        required this.noteAverage,
        required this.classDuration,
        this.approved,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 5.h,
          width: 44.w,
          color: AppColors.grayAcademicCardColor,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
          child: Center(
            child: TextWidget(
              disciplineWorkload.isNotEmpty ?
              (firstFaults + secondFaults).toString() + " faltas | " +
              LoggedUser.getStudentAttendance(firstFaults, secondFaults, double.parse(disciplineWorkload), classDuration) + " frequência" :
              "0 faltas | 100% frequência",
              textColor: AppColors.blackColor,
              fontSize: 14.5.sp,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: 5.h,
          width: 44.w,
          color: AppColors.grayAcademicCardColor,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: RichTextTwoDifferentWidget(
                    firstText: "Média: ",
                    firstTextColor: AppColors.blackColor,
                    firstTextFontWeight: FontWeight.normal,
                    firstTextSize: 14.5.sp,
                    secondText: noteAverage,
                    secondTextColor: AppColors.blackColor,
                    secondTextFontWeight: FontWeight.bold,
                    secondTextSize: 14.5.sp,
                    secondTextDecoration: TextDecoration.none,
                  ),
                ),
              ),
              GetStatusAcademicIcon.getStatusNoteAverage(approved),
            ],
          ),
        ),
      ],
    );
  }
}