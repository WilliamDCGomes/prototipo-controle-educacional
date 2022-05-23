import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/widgets/text_button_widget.dart';
import '../../shared/widgets/text_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../../helpers/reorderer_lists.dart';
import '../../../../stylePages/app_colors.dart';

class HomeTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  HomeTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
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
            padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonWidget(
                        onTap: () => widget.controller.openProfile(),
                        borderRadius: 2.h,
                        componentPadding: EdgeInsets.symmetric(horizontal: 2.w),
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: PlatformType.isTablet(context) ?
                          9.h : 7.h,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: CarouselSlider.builder(
                                  carouselController: widget.controller.carouselController,
                                  itemCount: widget.controller.cardMainMenuList.length,
                                  options: CarouselOptions(
                                    height: 18.h,
                                    viewportFraction: 1,
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
                                    return widget.controller.cardMainMenuList.elementAt(itemIndex);
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
                      ),
                      Expanded(
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
