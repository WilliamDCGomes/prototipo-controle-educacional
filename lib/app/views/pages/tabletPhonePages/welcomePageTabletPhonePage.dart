import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/welcomePageController.dart';
import '../../../helpers/paths.dart';
import '../../componentsWidgets/buttonWidget.dart';
import '../../componentsWidgets/textButtonWidget.dart';

class WelcomePageTabletPhonePage extends StatefulWidget {
  const WelcomePageTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<WelcomePageTabletPhonePage> createState() => _WelcomePageTabletPhonePageState();
}

class _WelcomePageTabletPhonePageState extends State<WelcomePageTabletPhonePage> {
  late WelcomePageController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => controller.activeStep.value = 0);
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(WelcomePageController());

    return Obx(() =>
      WillPopScope(
        onWillPop: () => controller.backStepper(),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors().backgroundFirstScreenColor,
              ),
            ),
            child: Scaffold(
              backgroundColor: AppColors().transparentColor,
              body: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h, right: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButtonWidget(
                              hintText: "Pular Introdução",
                              onTap: () => controller.goToLoginPage(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            controller.getCurrentPage(),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: DotStepper(
                                dotCount: 3,
                                dotRadius: 1.h,
                                activeStep: controller.activeStep.value,
                                shape: Shape.circle,
                                spacing: 2.w,
                                indicator: Indicator.magnify,
                                fixedDotDecoration: FixedDotDecoration(
                                  color: AppColors().grayStepColor,
                                ),
                                indicatorDecoration: IndicatorDecoration(
                                  // style: PaintingStyle.stroke,
                                  // strokeWidth: 8,
                                  color: AppColors().orangeColor,
                                ),
                                onDotTapped: (tappedDotIndex) {
                                  controller.activeStep.value = tappedDotIndex;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: ButtonWidget(
                                hintText: "PRÓXIMO",
                                fontWeight: FontWeight.bold,
                                widthButton: 75.w,
                                onPressed: () => controller.nextPage(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 78.h),
                    child: Image.asset(
                      '${Paths().imagesPath}Ilustracao_Rodape.png',
                      width: 100.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}