import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/format_numbers.dart';
import '../../../../../utils/get_status_academic_icon.dart';
import '../../../../../utils/logged_user.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class DisciplineInformationTabletPhonePopup {
  static List<Widget> getWidgetList(
    context,
    final String disciplineName,
    final String disciplineWorkload,
    final int firstFaults,
    final int secondFaults,
    final String professorDiscipline,
    final double? firstNote,
    final double? secondNote,
    final bool? approved,
    final int classDuration,
  ){
    return [
      Center(
        child: Container(
          height: .5.h,
          width: 40.w,
          color: AppColors.grayStepColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Container(
          height: 5.h,
          decoration: BoxDecoration(
            color: AppColors.purpleDefaultColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
          child: Center(
            child: TextWidget(
              disciplineName,
              textColor: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              textDecoration: TextDecoration.none,
              maxLines: 1,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: RichTextTwoDifferentWidget(
          firstText: "Carga Horária: ",
          firstTextColor: AppColors.blackColor,
          firstTextFontWeight: FontWeight.normal,
          firstTextSize: 16.sp,
          secondText: disciplineWorkload,
          secondTextColor: AppColors.blackColor,
          secondTextFontWeight: FontWeight.bold,
          secondTextSize: 16.sp,
          secondTextDecoration: TextDecoration.none,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: RichTextTwoDifferentWidget(
          firstText: "Professor: ",
          firstTextColor: AppColors.blackColor,
          firstTextFontWeight: FontWeight.normal,
          firstTextSize: 16.sp,
          secondText: professorDiscipline,
          secondTextColor: AppColors.blackColor,
          secondTextFontWeight: FontWeight.bold,
          secondTextSize: 16.sp,
          secondTextDecoration: TextDecoration.none,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: TextWidget(
                    "Nota 1º Bimestre:",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 44.w,
                  color: AppColors.grayAcademicCardColor,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Center(
                    child: TextWidget(
                      firstNote != null ?
                      FormatNumbers.numbersToString(firstNote) :
                      "-",
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: TextWidget(
                    "Nota 2º Bimestre:",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 44.w,
                  color: AppColors.grayAcademicCardColor,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Center(
                    child: TextWidget(
                      secondNote != null ?
                      FormatNumbers.numbersToString(secondNote) :
                      "-",
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 1.h),
        child: TextWidget(
          "Média:",
          textColor: AppColors.blackColor,
          fontSize: 16.sp,
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
      ),
      Container(
        height: 5.h,
        color: AppColors.grayAcademicCardColor,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                firstNote != null && secondNote != null ?
                FormatNumbers.getNumberAverage(firstNote, secondNote) :
                "-",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                textColor: AppColors.purpleDefaultColor,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: GetStatusAcademicIcon.getStatusNoteAverage(approved),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: TextWidget(
                    "Faltas 1º Bimestre:",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 44.w,
                  color: AppColors.grayAcademicCardColor,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Center(
                    child: TextWidget(
                      firstFaults.toString(),
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: TextWidget(
                    "Faltas 2º Bimestre:",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 44.w,
                  color: AppColors.grayAcademicCardColor,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Center(
                    child: TextWidget(
                      secondFaults.toString(),
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 1.h),
        child: TextWidget(
          "Frequência:",
          textColor: AppColors.blackColor,
          fontSize: 16.sp,
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
      ),
      Container(
        height: 5.h,
        color: AppColors.grayAcademicCardColor,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        child: Center(
          child: TextWidget(
            disciplineWorkload.isNotEmpty ?
            LoggedUser.getStudentAttendance(firstFaults, secondFaults, double.parse(disciplineWorkload), classDuration) + " frequência" :
            "100%",
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            textColor: AppColors.purpleDefaultColor,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: ButtonWidget(
          hintText: "FECHAR",
          fontWeight: FontWeight.bold,
          widthButton: 75.w,
          onPressed: () => Get.back(),
        ),
      ),
    ];
  }
}