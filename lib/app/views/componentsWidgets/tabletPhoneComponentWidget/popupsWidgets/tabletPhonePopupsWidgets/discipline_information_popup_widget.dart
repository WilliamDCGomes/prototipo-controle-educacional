import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/format_numbers.dart';
import '../../../../../helpers/get_status_academic_icon.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../button_widget.dart';
import '../../../rich_text_two_different_widget.dart';
import '../../../text_widget.dart';

class DisciplineInformationPopupWidget {
  static List<Widget> getWidgetList(
    context,
    final String disciplineCode,
    final String disciplineName,
    final String disciplineWorkload,
    final String firstCardInformation,
    final String professorDiscipline,
    final double? firstNote,
    final double? secondNote,
    final bool? approved,
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
            child: RichTextTwoDifferentWidget(
              firstText: "$disciplineCode - ",
              firstTextColor: AppColors.whiteColor,
              firstTextFontWeight: FontWeight.normal,
              firstTextSize: 16.sp,
              secondText: disciplineName,
              secondTextColor: AppColors.whiteColor,
              secondTextFontWeight: FontWeight.bold,
              secondTextSize: 16.sp,
              secondTextDecoration: TextDecoration.none,
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
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: TextWidget(
          "Faltas:",
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
            firstCardInformation,
            textColor: AppColors.orangeColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
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