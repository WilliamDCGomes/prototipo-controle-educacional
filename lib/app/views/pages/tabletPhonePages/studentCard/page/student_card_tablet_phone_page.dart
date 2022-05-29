import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/student_card_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../widgets/student_card_widget.dart';

class StudentCardTabletPhonePage extends StatelessWidget {
  final StudentCardController controller = Get.put(StudentCardController());

  StudentCardTabletPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    Paths.Ilustracao_Topo,
                    width: 25.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TitleWithBackButtonWidget(
                              title: "Carteirinha Online",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: StudentCardWidget(
                          imageBasePath: controller.imageBasePath,
                          cardNumber: controller.cardNumber,
                          raNumber: controller.raNumber,
                          nameStudent: controller.studentName,
                          validateCard: controller.validateCard,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: TextWidget(
                                "Nome:",
                                textColor: AppColors.blackColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: TextWidget(
                                controller.studentName,
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: TextWidget(
                                "RA (Registro Acadêmico):",
                                textColor: AppColors.blackColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: TextWidget(
                                controller.raNumber,
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: TextWidget(
                                "Número da Carteirinha:",
                                textColor: AppColors.blackColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0.h),
                              child: TextButtonWidget(
                                onTap: () {

                                },
                                componentPadding: EdgeInsets.zero,
                                widgetCustom: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Paths.Icone_Copiar,
                                      width: 2.h,
                                    ),
                                    TextWidget(
                                      " ${controller.cardNumber}",
                                      maxLines: 1,
                                      textColor: AppColors.blueLinkColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: TextWidget(
                                "Validade:",
                                textColor: AppColors.blackColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: TextWidget(
                                controller.validateCard,
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
