import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controllers/register_user_tablet_phone_controller.dart';

class RegisterUserTabletPhonePage extends StatefulWidget {
  const RegisterUserTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<RegisterUserTabletPhonePage> createState() => _RegisterUserTabletPhonePageState();
}

class _RegisterUserTabletPhonePageState extends State<RegisterUserTabletPhonePage> {
  late RegisterUserTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(RegisterUserTabletPhoneController());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        controller.activeStep.value = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return await controller.backButtonPressed();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Material(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.backgroundFirstScreenColor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h,),
                    child: Scaffold(
                      backgroundColor: AppColors.transparentColor,
                      body: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.h,),
                            child: TitleWithBackButtonTabletPhoneWidget(
                              title: "Cadastro",
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Obx(
                                    () => controller.headerRegisterStepperList[controller.activeStep.value],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 3.h),
                                    child: Obx(
                                      () => Center(
                                        child: DotStepper(
                                          dotCount: 7,
                                          dotRadius: 1.h,
                                          activeStep: controller.activeStep.value,
                                          shape: Shape.circle,
                                          spacing: 3.w,
                                          indicator: Indicator.magnify,
                                          fixedDotDecoration: FixedDotDecoration(
                                            color: AppColors.grayStepColor,
                                          ),
                                          indicatorDecoration: IndicatorDecoration(
                                            color: AppColors.orangeColor,
                                          ),
                                          tappingEnabled: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.h,),
                                    child: Obx(
                                      () => controller.bodyRegisterStepperList[controller.activeStep.value],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h,),
                              child: ButtonWidget(
                                hintText: "AVANÇAR",
                                fontWeight: FontWeight.bold,
                                widthButton: 90.w,
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  controller.nextButtonPressed();
                                },
                              ),
                            ),
                          ),
                          Obx(() => controller.activeStep.value == 0 ?
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 75.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.h,),
                                child: TextWidget(
                                  controller.lgpdPhrase,
                                  textColor: AppColors.blackColor,
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ) : SizedBox(height: 2.h),
                          ),
                        ],
                      ),
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
