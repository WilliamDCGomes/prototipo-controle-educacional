import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/switch_widget.dart';
import '../controller/finger_print_setting_tablet_phone_controller.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';

class FingerPrintSettingTabletPhonePage extends StatefulWidget {
  const FingerPrintSettingTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<FingerPrintSettingTabletPhonePage> createState() => _FingerPrintSettingTabletPhonePageState();
}

class _FingerPrintSettingTabletPhonePageState extends State<FingerPrintSettingTabletPhonePage> {
  late FingerPrintSettingTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(FingerPrintSettingTabletPhoneController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        title: "Configuração da Digital",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InformationContainerTabletPhoneWidget(
                            iconPath: Paths.Icone_Configuracao_Biometria,
                            textColor: AppColors.whiteColor,
                            backgroundColor: AppColors.purpleDefaultColor,
                            informationText: "Configure o acesso do aplicativo pela sua digital!",
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Obx(
                                          () => SwitchWidget(
                                            text: "Habilitar o login por digital?",
                                            checked: controller.fingerPrintLoginChecked.value,
                                            onClicked: () => controller.fingerPrintLoginPressed(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Obx(
                                          () => SwitchWidget(
                                            text: "Sempre solicitar a digital quando entrar no aplicativo?",
                                            checked: controller.alwaysRequestFingerPrintChecked.value,
                                            justRead: controller.enableAlwaysRequestFingerPrint.value,
                                            onClicked: () => controller.alwaysRequestFingerPrintPressed(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Obx(
                                          () => SwitchWidget(
                                            text: "Habilitar a digital para pagamentos no aplicativo?",
                                            checked: controller.fingerPrintPaymentChecked.value,
                                            onClicked: () => controller.fingerPrintPaymentPressed(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Obx(
                                          () => SwitchWidget(
                                            text: "Habilitar a digital para solicitar cancelamento de matrícula?",
                                            checked: controller.fingerPrintRegistrationCancellationChecked.value,
                                            onClicked: () => controller.fingerPrintRegistrationCancellationPressed(),
                                          ),
                                        ),
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
                              hintText: "SALVAR",
                              focusNode: controller.saveButtonFocusNode,
                              fontWeight: FontWeight.bold,
                              widthButton: double.infinity,
                              onPressed: () => controller.saveButtonPressed(),
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
    );
  }
}
