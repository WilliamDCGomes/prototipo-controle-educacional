import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/helpers/platform_type.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/app_close_controller.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controllers/registration_completed_tablet_phone_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class RegistrationCompletedTabletPhone extends StatelessWidget {
  late final RegistrationCompletedTabletPhoneController controller;
  RegistrationCompletedTabletPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.put(RegistrationCompletedTabletPhoneController());

    return WillPopScope(
      onWillPop: () async {
        return AppCloseController.verifyCloseScreen();
      },
      child: Material(
        child: SafeArea(
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
                SvgPicture.asset(
                  Paths.Ilustracao_Topo,
                  width: 26.w,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: PlatformType.isTablet(context) ? 51.h : 47.h
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        Paths.Ilustracao_Finalizacao,
                        width: 30.w,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 12.h, 5.w, 0),
                  child: Scaffold(
                    backgroundColor: AppColors.transparentColor,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SvgPicture.asset(
                          Paths.Logo_Finalizacao,
                          width: 40.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: SvgPicture.asset(
                            Paths.Icone_Finalizacao,
                            width: 15.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: TextWidget(
                            controller.firstText,
                            textColor: AppColors.purpleDefaultColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: TextWidget(
                            controller.secondText,
                            textColor: AppColors.purpleDefaultColor,
                            fontSize: 17.sp,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: TextWidget(
                            controller.thirdText,
                            textColor: AppColors.blackColor,
                            fontSize: 17.sp,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              TextButtonWidget(
                                onTap: () => controller.openWebSite(),
                                widgetCustom: TextWidget(
                                  controller.siteText,
                                  textColor: AppColors.purpleDefaultColor,
                                  fontSize: 17.sp,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  textDecoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: ButtonWidget(
                            hintText: "VOLTAR PARA O LOGIN",
                            fontWeight: FontWeight.bold,
                            widthButton: 90.w,
                            onPressed: () => controller.backToLoginPage(),
                          ),
                        ),
                      ],
                    ),
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