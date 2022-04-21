import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../helpers/paths.dart';
import '../../componentsWidgets/textButtonWidget.dart';
import '../../componentsWidgets/textWidget.dart';
import '../../stylePages/appColors.dart';

class MainMenuTabletPhonePage extends StatefulWidget {
  const MainMenuTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<MainMenuTabletPhonePage> createState() => _MainMenuTabletPhonePageState();
}

class _MainMenuTabletPhonePageState extends State<MainMenuTabletPhonePage> {
  late MainMenuTabletPhoneController controller;

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
    controller = Get.put(MainMenuTabletPhoneController());

    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors().backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    '${Paths().svgsPath}Ilustracao_Topo.svg',
                    width: 25.w,
                  ),
                ),
                Scaffold(
                  backgroundColor: AppColors().transparentColor,
                  body: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 9.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButtonWidget(
                                onTap: (){

                                },
                                borderRadius: 2.h,
                                widgetCustom: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.w),
                                      child: Container(
                                        height: 7.h,
                                        width: 7.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3.5.h),
                                          color: AppColors().grayColor,
                                        ),
                                        child: Obx(
                                              () => controller.hasPicture.value ?
                                          Image.asset(
                                              ""
                                          ) :
                                          Center(
                                            child: TextWidget(
                                              controller.nameInitials,
                                              textColor: AppColors().standardColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          "Olá, William",
                                          textColor: AppColors().blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                        Obx(() => TextWidget(
                                          controller.welcomePhrase.value,
                                          textColor: AppColors().blackColor,
                                          fontSize: 17.sp,
                                          textAlign: TextAlign.start,
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                '${Paths().svgsPath}Logo_Pce_Home.svg',
                                width: 15.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 9.h),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  child: CarouselSlider.builder(
                                    carouselController: controller.carouselController,
                                    itemCount: 3,
                                    options: CarouselOptions(
                                        height: 18.h,
                                        viewportFraction: 1,
                                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                                        enlargeCenterPage: true,
                                        enableInfiniteScroll: false,
                                        onPageChanged: (itemIndex, reason){
                                          setState(() {
                                            controller.activeStep = itemIndex;
                                          });
                                        }
                                    ),
                                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                      return controller.cardMainMenuList.elementAt(itemIndex);
                                    },
                                  ),
                                ),
                                DotStepper(
                                  dotCount: 3,
                                  dotRadius: 1.h,
                                  activeStep: controller.activeStep,
                                  shape: Shape.stadium,
                                  spacing: 3.w,
                                  indicator: Indicator.magnify,
                                  fixedDotDecoration: FixedDotDecoration(
                                    color: AppColors().grayStepColor,
                                  ),
                                  indicatorDecoration: IndicatorDecoration(
                                    // style: PaintingStyle.stroke,
                                    // strokeWidth: 8,
                                    color: AppColors().purpleDefaultColor,
                                  ),
                                  onDotTapped: (tappedDotIndex) {
                                    setState(() {
                                      controller.activeStep = tappedDotIndex;
                                      controller.carouselController.jumpToPage(tappedDotIndex);
                                    });
                                  },
                                ),
                              ],
                            ),
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
