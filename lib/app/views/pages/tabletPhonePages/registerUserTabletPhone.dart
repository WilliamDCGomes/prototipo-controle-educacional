import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/registerUserController.dart';
import '../../componentsWidgets/buttonWidget.dart';
import '../../componentsWidgets/textButtonWidget.dart';
import '../../componentsWidgets/textWidget.dart';

class RegisterUserTabletPhone extends StatefulWidget {
  const RegisterUserTabletPhone({Key? key}) : super(key: key);

  @override
  State<RegisterUserTabletPhone> createState() => _RegisterUserTabletPhoneState();
}

class _RegisterUserTabletPhoneState extends State<RegisterUserTabletPhone> {
  late RegisterUserController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_){
      setState(() {
        controller.activeStep.value = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(RegisterUserController());

    return WillPopScope(
      onWillPop: () async {
        return await controller.backButtonPressed();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors().backgroundFirstScreenColor,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
              child: Scaffold(
                backgroundColor: AppColors().transparentColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButtonWidget(
                              onTap: () => controller.backButtonPressed(),
                              widgetCustom: Icon(
                                Icons.arrow_back,
                                color: AppColors().arrowBlackColor,
                                size: 3.h,
                              ),
                            ),
                            TextWidget(
                              "Cadastro",
                              textColor: AppColors().purpleDefaultColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                          ],
                        ),
                      ),
                      Obx(() => controller.headerRegisterStepperList.elementAt(
                          controller.activeStep.value
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
                        child: Obx(() => DotStepper(
                            dotCount: 7,
                            dotRadius: 1.h,
                            activeStep: controller.activeStep.value,
                            shape: Shape.circle,
                            spacing: 3.w,
                            indicator: Indicator.magnify,
                            fixedDotDecoration: FixedDotDecoration(
                              color: AppColors().grayStepColor,
                            ),
                            indicatorDecoration: IndicatorDecoration(
                              color: AppColors().orangeColor,
                            ),
                            tappingEnabled: false,
                          ),
                        ),
                      ),
                      Obx(() => controller.bodyRegisterStepperList.elementAt(
                          controller.activeStep.value
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: ButtonWidget(
                          hintText: "AVANÇAR",
                          fontWeight: FontWeight.bold,
                          widthButton: 90.w,
                          onPressed: () => controller.nextButtonPressed(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
