import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/reset_password_tablet_phone_controller.dart';

class ResetPasswordTabletPhonePage extends StatefulWidget {
  const ResetPasswordTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordTabletPhonePage> createState() => _ResetPasswordTabletPhonePageState();
}

class _ResetPasswordTabletPhonePageState extends State<ResetPasswordTabletPhonePage> {
  late ResetPasswordTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(ResetPasswordTabletPhoneController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Container(
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
                  padding: EdgeInsets.only(top: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: "Redefinir Senha",
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InformationContainerTabletPhoneWidget(
                                iconPath: Paths.Redefinir_Senha,
                                textColor: AppColors.whiteColor,
                                backgroundColor: AppColors.purpleDefaultColor,
                                informationText: "Informe sua senha atual e sua nova senha para prosseguir!",
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.h),
                                      child: Obx(
                                        () => TextFieldWidget(
                                          controller: controller.oldPasswordInput,
                                          hintText: "Senha Atual",
                                          height: PlatformType.isTablet(context) ? 7.h : 9.h,
                                          width: double.infinity,
                                          isPassword: controller.oldPasswordVisible.value,
                                          iconTextField: GestureDetector(
                                            onTap: () {
                                              controller.oldPasswordVisible.value =
                                              !controller.oldPasswordVisible.value;
                                            },
                                            child: Icon(
                                              controller.oldPasswordVisible.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.purpleDefaultColor,
                                              size: 2.5.h,
                                            ),
                                          ),
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: Obx(
                                        () => TextFieldWidget(
                                          controller: controller.newPasswordInput,
                                          hintText: "Nova Senha",
                                          height: PlatformType.isTablet(context) ? 7.h : 9.h,
                                          width: double.infinity,
                                          isPassword: controller.newPasswordVisible.value,
                                          iconTextField: GestureDetector(
                                            onTap: () {
                                              controller.newPasswordVisible.value =
                                              !controller.newPasswordVisible.value;
                                            },
                                            child: Icon(
                                              controller.newPasswordVisible.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.purpleDefaultColor,
                                              size: 2.5.h,
                                            ),
                                          ),
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: Obx(
                                        () => TextFieldWidget(
                                          controller: controller.confirmNewPasswordInput,
                                          hintText: "Confirmar Nova Senha",
                                          height: PlatformType.isTablet(context) ? 7.h : 9.h,
                                          width: double.infinity,
                                          isPassword: controller.confirmNewPasswordVisible.value,
                                          iconTextField: GestureDetector(
                                            onTap: () {
                                              controller.confirmNewPasswordVisible.value =
                                              !controller.confirmNewPasswordVisible.value;
                                            },
                                            child: Icon(
                                              controller.confirmNewPasswordVisible.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.purpleDefaultColor,
                                              size: 2.5.h,
                                            ),
                                          ),
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.h),
                              child: ButtonWidget(
                                hintText: "REDEFINIR SENHA",
                                fontWeight: FontWeight.bold,
                                widthButton: double.infinity,
                                onPressed: () => controller.resetPasswordButtonPressed(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                controller.loadingWithSuccessOrErrorTabletPhoneWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
