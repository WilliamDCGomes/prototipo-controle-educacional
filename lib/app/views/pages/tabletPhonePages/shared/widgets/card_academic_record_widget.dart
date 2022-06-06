import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../academicRecord/page/academic_record_tablet_phone_page.dart';
import '../../gradesFault/controller/grades_faults_controller.dart';
import '../../mainMenu/controller/main_menu_tablet_phone_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class CardAcademicRecordWidget extends StatelessWidget {
  final String yearValueText;
  final String semesterValueText;
  final GradesFaultsController? gradesFaultsController;
  final MainMenuTabletPhoneController? mainMenuTabletPhoneController;

  const CardAcademicRecordWidget(
      { Key? key,
        required this.yearValueText,
        required this.semesterValueText,
        this.gradesFaultsController,
        this.mainMenuTabletPhoneController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 18.h,
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
                  SizedBox(
                    height: .5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonWidget(
                        onTap: () => mainMenuTabletPhoneController != null ?
                          mainMenuTabletPhoneController!.previousAcademicRecordCard() :
                          gradesFaultsController!.previousAcademicRecordCard(),
                        height: 4.h,
                        width: 4.h,
                        componentPadding: EdgeInsets.zero,
                        widgetCustom: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: AppColors.purpleDefaultColor,
                          size: 2.5.h,
                        ),
                      ),
                      TextWidget(
                        yearValueText,
                        textColor: AppColors.purpleDefaultColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.sp,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                      TextButtonWidget(
                        onTap: () => mainMenuTabletPhoneController != null ?
                          mainMenuTabletPhoneController!.nextAcademicRecordCard() :
                          gradesFaultsController!.nextAcademicRecordCard(),
                        height: 4.h,
                        width: 4.h,
                        componentPadding: EdgeInsets.zero,
                        widgetCustom: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.purpleDefaultColor,
                          size: 2.5.h,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: TextWidget(
                      semesterValueText,
                      maxLines: 1,
                      fontSize: 19.sp,
                      textColor: AppColors.purpleDefaultColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: [
                      TextButtonWidget(
                        onTap: () => Get.to(() => AcademicRecordTabletPhonePage()),
                        widgetCustom: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                             Paths.Icone_Copiar,
                              width: 2.h,
                            ),
                            TextWidget(
                              " Ver Histórico Acadêmico",
                              maxLines: 1,
                              textColor: AppColors.blueLinkColor,
                              fontSize: 17.sp,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
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