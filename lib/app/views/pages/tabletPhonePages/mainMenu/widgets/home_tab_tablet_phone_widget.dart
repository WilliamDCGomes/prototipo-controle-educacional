import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/reorderer_lists.dart';
import '../../../../stylePages/app_colors.dart';

class HomeTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  HomeTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeTabTabletPhoneWidget> createState() => _HomeTabTabletPhoneWidgetState();
}

class _HomeTabTabletPhoneWidgetState extends State<HomeTabTabletPhoneWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        widget.controller.activeStep = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            padding: EdgeInsets.only(top: 2.h,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonWidget(
                        onTap: () => widget.controller.openProfile(),
                        borderRadius: 1.h,
                        componentPadding: EdgeInsets.zero,
                        widgetCustom: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 3.w),
                              child: Container(
                                height: 6.5.h,
                                width: 6.5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.25.h),
                                  color: AppColors.standardColor,
                                ),
                                child: Obx(
                                      () => widget.controller.hasPicture.value ?
                                  Image.asset(
                                      ""
                                  ) :
                                  Center(
                                    child: TextWidget(
                                      widget.controller.nameInitials,
                                      textColor: AppColors.grayColor,
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
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                                Obx(() => TextWidget(
                                  widget.controller.welcomePhrase.value,
                                  textColor: AppColors.blackColor,
                                  fontSize: 17.sp,
                                  textAlign: TextAlign.start,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        Paths.Logo_Pce_Home,
                        width: 15.w,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: CarouselSlider.builder(
                                carouselController: widget.controller.carouselController,
                                itemCount: widget.controller.cardMainMenuList.length,
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  height: PlatformType.isTablet(context) ? 30.h : 27.h,
                                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (itemIndex, reason){
                                    setState(() {
                                      widget.controller.activeStep = itemIndex;
                                    });
                                  }
                                ),
                                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                  return widget.controller.cardMainMenuList[itemIndex];
                                },
                              ),
                            ),
                            DotStepper(
                              dotCount: widget.controller.cardMainMenuList.length,
                              dotRadius: 1.h,
                              activeStep: widget.controller.activeStep,
                              shape: Shape.stadium,
                              spacing: 3.w,
                              indicator: Indicator.magnify,
                              fixedDotDecoration: FixedDotDecoration(
                                color: AppColors.grayStepColor,
                              ),
                              indicatorDecoration: IndicatorDecoration(
                                color: AppColors.purpleDefaultColor,
                              ),
                              onDotTapped: (tappedDotIndex) {
                                setState(() {
                                  widget.controller.activeStep = tappedDotIndex;
                                  widget.controller.carouselController.jumpToPage(tappedDotIndex);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.h, top: 2.h, right: 2.h),
                          child: ReorderableListView.builder(
                            itemCount: widget.controller.groupMenuHomeList.length,
                            itemBuilder: (context, index){
                              return Container(
                                key: Key("$index"),
                                child: widget.controller.groupMenuHomeList[index],
                              );
                            },
                            onReorder: (oldIndex, newIndex) {
                              var newList = ReorderListHelper.reorderList(
                                oldIndex,
                                newIndex,
                                widget.controller.groupMenuHomeList,
                              );
                              //TODO Fazer um método para salvar a nova lista
                            }
                          ),
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
    );
  }
}
