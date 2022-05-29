import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controller/academic_record_controller.dart';

class CardAcademicStudentRecordWidget extends StatelessWidget {
  final AcademicRecordController? academicRecordController;

  const CardAcademicStudentRecordWidget(
    { Key? key,
      required this.academicRecordController,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 20.h,
        width: 95.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
          color: AppColors.whiteColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextWidget(
                    academicRecordController!.studentName,
                    textColor: AppColors.purpleDefaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.sp,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichTextTwoDifferentWidget(
                        firstText: "Nascimento: ",
                        firstTextColor: AppColors.blackColor,
                        firstTextFontWeight: FontWeight.normal,
                        firstTextSize: 16.sp,
                        secondText: academicRecordController!.studentBirthday,
                        secondTextColor: AppColors.blackColor,
                        secondTextFontWeight: FontWeight.bold,
                        secondTextSize: 16.sp,
                        secondTextDecoration: TextDecoration.none,
                        maxLines: 1,
                      ),
                      RichTextTwoDifferentWidget(
                        firstText: "RA: ",
                        firstTextColor: AppColors.blackColor,
                        firstTextFontWeight: FontWeight.normal,
                        firstTextSize: 16.sp,
                        secondText: academicRecordController!.studentRA,
                        secondTextColor: AppColors.blackColor,
                        secondTextFontWeight: FontWeight.bold,
                        secondTextSize: 16.sp,
                        secondTextDecoration: TextDecoration.none,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichTextTwoDifferentWidget(
                        firstText: "Turma: ",
                        firstTextColor: AppColors.blackColor,
                        firstTextFontWeight: FontWeight.normal,
                        firstTextSize: 16.sp,
                        secondText: academicRecordController!.studentClass,
                        secondTextColor: AppColors.blackColor,
                        secondTextFontWeight: FontWeight.bold,
                        secondTextSize: 16.sp,
                        secondTextDecoration: TextDecoration.none,
                        maxLines: 1,
                      ),
                      RichTextTwoDifferentWidget(
                        firstText: "Curso: ",
                        firstTextColor: AppColors.blackColor,
                        firstTextFontWeight: FontWeight.normal,
                        firstTextSize: 16.sp,
                        secondText: academicRecordController!.studentCourse,
                        secondTextColor: AppColors.blackColor,
                        secondTextFontWeight: FontWeight.bold,
                        secondTextSize: 16.sp,
                        secondTextDecoration: TextDecoration.none,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Center(
                    child: RichTextTwoDifferentWidget(
                      firstText: "Situação Acadêmica: ",
                      firstTextColor: AppColors.blackColor,
                      firstTextFontWeight: FontWeight.bold,
                      firstTextSize: 16.sp,
                      secondText: academicRecordController!.studentStatus,
                      secondTextColor: AppColors.greenColor,
                      secondTextFontWeight: FontWeight.bold,
                      secondTextSize: 16.sp,
                      secondTextDecoration: TextDecoration.none,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}