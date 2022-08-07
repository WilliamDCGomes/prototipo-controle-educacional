import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../controller/academic_record_tablet_phone_controller.dart';

class CardAcademicStudentRecordTabletPhoneWidget extends StatelessWidget {
  final AcademicRecordTabletPhoneController? academicRecordTabletPhoneController;

  const CardAcademicStudentRecordTabletPhoneWidget(
    { Key? key,
      required this.academicRecordTabletPhoneController,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: InformationContainerTabletPhoneWidget(
        iconPath: Paths.Icone_Exibicao_Historico_Academico,
        textColor: AppColors.purpleDefaultColor,
        backgroundColor: AppColors.whiteColor,
        informationText: "",
        customContainer: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(
              academicRecordTabletPhoneController!.studentName,
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
                  firstTextSize: 15.sp,
                  secondText: academicRecordTabletPhoneController!.studentBirthday,
                  secondTextColor: AppColors.blackColor,
                  secondTextFontWeight: FontWeight.bold,
                  secondTextSize: 15.sp,
                  secondTextDecoration: TextDecoration.none,
                  maxLines: 1,
                ),
                RichTextTwoDifferentWidget(
                  firstText: "RA: ",
                  firstTextColor: AppColors.blackColor,
                  firstTextFontWeight: FontWeight.normal,
                  firstTextSize: 15.sp,
                  secondText: academicRecordTabletPhoneController!.studentRA,
                  secondTextColor: AppColors.blackColor,
                  secondTextFontWeight: FontWeight.bold,
                  secondTextSize: 15.sp,
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
                  firstTextSize: 15.sp,
                  secondText: academicRecordTabletPhoneController!.studentClass,
                  secondTextColor: AppColors.blackColor,
                  secondTextFontWeight: FontWeight.bold,
                  secondTextSize: 15.sp,
                  secondTextDecoration: TextDecoration.none,
                  maxLines: 1,
                ),
                RichTextTwoDifferentWidget(
                  firstText: "Curso: ",
                  firstTextColor: AppColors.blackColor,
                  firstTextFontWeight: FontWeight.normal,
                  firstTextSize: 15.sp,
                  secondText: academicRecordTabletPhoneController!.studentCourse,
                  secondTextColor: AppColors.blackColor,
                  secondTextFontWeight: FontWeight.bold,
                  secondTextSize: 15.sp,
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
                firstTextSize: 15.sp,
                secondText: academicRecordTabletPhoneController!.studentStatus,
                secondTextColor: AppColors.greenColor,
                secondTextFontWeight: FontWeight.bold,
                secondTextSize: 15.sp,
                secondTextDecoration: TextDecoration.none,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}