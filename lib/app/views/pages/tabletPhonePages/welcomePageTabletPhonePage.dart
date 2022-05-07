import 'package:carousel_slider/carousel_slider.dart';
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
    WidgetsBinding.instance!.addPostFrameCallback((_){
      setState(() {
        controller.activeStep = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(WelcomePageController());

    return WillPopScope(
      onWillPop: () async {
        bool returnFuction = await controller.backStepper();
        if(!returnFuction)
          setState(() {
            controller.activeStep--;
            controller.carouselController.jumpToPage(controller.activeStep);
          });
        return returnFuction;
      },
      child: SafeArea(
        child: Material(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      '${Paths.imagesPath}Ilustracao_Rodape.png',
                      height: 14.h,
                    ),
                  ],
                ),
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
                          CarouselSlider.builder(
                            carouselController: controller.carouselController,
                            itemCount: 3,
                            options: CarouselOptions(
                                height: 55.h,
                                viewportFraction: 1,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                onPageChanged: (itemIndex, reason){
                                  setState(() {
                                    controller.activeStep = itemIndex;
                                  });
                                }
                            ),
                            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                              return controller.pageIntroduction.elementAt(itemIndex);
                            },
                          ),
                          DotStepper(
                            dotCount: 3,
                            dotRadius: 1.h,
                            activeStep: controller.activeStep,
                            shape: Shape.circle,
                            spacing: 3.w,
                            indicator: Indicator.magnify,
                            fixedDotDecoration: FixedDotDecoration(
                              color: AppColors.grayStepColor,
                            ),
                            indicatorDecoration: IndicatorDecoration(
                              color: AppColors.orangeColor,
                            ),
                            onDotTapped: (tappedDotIndex) {
                              setState(() {
                                controller.activeStep = tappedDotIndex;
                                controller.carouselController.jumpToPage(tappedDotIndex);
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: ButtonWidget(
                              hintText: "PRÓXIMO",
                              fontWeight: FontWeight.bold,
                              widthButton: 75.w,
                              onPressed: (){
                                setState(() {
                                  controller.nextPage();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}