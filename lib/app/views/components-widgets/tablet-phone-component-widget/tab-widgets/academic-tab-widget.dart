import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/main-menu-tablet-phone-controller.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/platform-type.dart';
import '../../../style-pages/app-colors.dart';
import '../../text-button-widget.dart';
import '../../text-widget.dart';

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
                                      return widget.controller.cardAcademicRecordList.elementAt(itemIndex);
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
                                    text: "Grade Curricular",
                                    height: 3.h,
                                  ),
                                  Tab(
                                    text: "Entregas",
                                    height: 3.h,
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