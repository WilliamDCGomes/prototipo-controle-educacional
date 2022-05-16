import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/grades-faults-controller.dart';
import '../../../helpers/paths.dart';
import '../../../helpers/platform-type.dart';
import '../../components-Widgets/text-button-widget.dart';
import '../../components-Widgets/text-widget.dart';
import '../../style-Pages/app-colors.dart';

class GradesFaultsTabletPhonePage extends StatefulWidget {
  const GradesFaultsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<GradesFaultsTabletPhonePage> createState() => _GradesFaultsTabletPhonePageState();
}

class _GradesFaultsTabletPhonePageState extends State<GradesFaultsTabletPhonePage> {
  late GradesFaultsController controller;
  @override
  void initState() {
    controller = Get.put(GradesFaultsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                                  "Botas e Faltas",
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                                TextButtonWidget(
                                  onTap: () {

                                  },
                                  height: 6.5.w,
                                  width: 7.w,
                                  componentPadding: EdgeInsets.all(.5.w),
                                  widgetCustom: Center(
                                    child: Icon(
                                      Icons.download_rounded,
                                      size: 6.w,
                                      color: AppColors.purpleDefaultColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 82.h,
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
                                        carouselController: controller
                                            .academicRecordCarouselController,
                                        itemCount: controller.cardAcademicRecordList.length,
                                        options: CarouselOptions(
                                            height: 18.h,
                                            viewportFraction: 1,
                                            enlargeStrategy: CenterPageEnlargeStrategy
                                                .height,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: false,
                                        ),
                                        itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) {
                                          return controller
                                              .cardAcademicRecordList.elementAt(
                                              itemIndex);
                                        },
                                      ),
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
        ),
      ),
    );
  }
}
