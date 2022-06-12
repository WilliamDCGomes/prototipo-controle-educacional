import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';

class AcademicTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  AcademicTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AcademicTabWidget> createState() => _AcademicTabWidgetState();
}

class _AcademicTabWidgetState extends State<AcademicTabWidget> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.controller.tabAcademicController = TabController(
      length: 2,
      vsync: this,
    );
    widget.controller.tabAcademicController.addListener(() {
      widget.controller.deliveryTabSelected.value = widget.controller.tabAcademicController.previousIndex == 0;
    });
    super.initState();
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
          Scaffold(
            backgroundColor: AppColors.transparentColor,
            body: Padding(
              padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              "Acadêmico",
                              textColor: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              textAlign: TextAlign.start,
                            ),
                            TextButtonWidget(
                              onTap: () => widget.controller.openConfiguration(),
                              height: 6.5.w,
                              width: 7.w,
                              componentPadding: EdgeInsets.all(.5.w),
                              widgetCustom: SvgPicture.asset(
                                Paths.Icone_Filtro,
                                height: 6.5.w,
                                width: 6.5.w,
                                color: AppColors.purpleDefaultColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 82.h ,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: PlatformType.isTablet(context) ?
                                9.h : 7.h,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  child: CarouselSlider.builder(
                                    carouselController: widget.controller.academicRecordCarouselController,
                                    itemCount: widget.controller.cardAcademicRecordList.length,
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
                                      return widget.controller.cardAcademicRecordList[itemIndex];
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                              child: TabBar(
                                controller: widget.controller.tabAcademicController,
                                indicatorColor: AppColors.purpleDefaultColor,
                                indicatorWeight: .3.h,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                labelColor: AppColors.purpleTabColor,
                                unselectedLabelColor: AppColors.grayTabColor,
                                tabs: [
                                  Tab(
                                    height: 3.h,
                                    child: Obx(
                                      () => TextWidget(
                                        "Grade Curricular",
                                        textColor: !widget.controller.deliveryTabSelected.value ? AppColors.purpleDefaultColor : AppColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    height: 3.h,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Obx(
                                          () => TextWidget(
                                            "Entregas",
                                            textColor: widget.controller.deliveryTabSelected.value ? AppColors.purpleDefaultColor : AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.sp,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: .5.h,
                                            horizontal: 3.w,
                                          ),
                                          margin: EdgeInsets.only(left: 2.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.orangeColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(1.5.h),
                                            ),
                                          ),
                                          child: TextWidget(
                                            widget.controller.deliveryTabList.length.toString(),
                                            textColor: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: SizedBox(
                                height: 42.h,
                                child: TabBarView(
                                  controller: widget.controller.tabAcademicController,
                                  children: widget.controller.tabAcademicRecordList,
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
        ],
      ),
    );
  }
}