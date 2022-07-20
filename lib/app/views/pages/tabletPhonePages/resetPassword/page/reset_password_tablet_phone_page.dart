import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
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
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TitleWithBackButtonTabletPhoneWidget(
                        title: "Redefinir Senha",
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                top: PlatformType.isTablet(context) ? 9.h : 7.h,
                              ),
                              padding: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 3.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                color: AppColors.purpleDefaultColor,
                              ),
                              child: TextWidget(
                                "Informe sua senha atual e sua nova senha para prosseguir!",
                                textColor: AppColors.whiteColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Obx(
                                      () => TextFieldWidget(
                                        controller: controller.oldPasswordInput,
                                        hintText: "Senha Atual",
                                        height: 6.h,
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
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Obx(
                                      () => TextFieldWidget(
                                        controller: controller.newPasswordInput,
                                        hintText: "Nova Senha",
                                        height: 6.h,
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
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Obx(
                                      () => TextFieldWidget(
                                        controller: controller.confirmNewPasswordInput,
                                        hintText: "Confirmar Nova Senha",
                                        height: 6.h,
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
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
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    margin: EdgeInsets.only(
                      top: PlatformType.isTablet(context) ? 14.h : 12.h,
                      right: 2.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5.h),
                      color: AppColors.purpleDefaultColor,
                    ),
                    child: Image.asset(
                      Paths.Redefinir_Senha,
                      height: 5.h,
                      width: 5.h,
                    ),
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
