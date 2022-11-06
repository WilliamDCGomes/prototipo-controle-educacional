import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../utils/paths.dart';
import '../../../../../../utils/platform_type.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../shared/widgets/card_main_menu_tablet_phone_widget.dart';
import '../../../shared/widgets/profile_picture_tablet_phone_widget.dart';
import '../../controller/main_menu_tablet_phone_controller.dart';
import '../group_menu_home_tablet_phone_widgets.dart';
import '../menu_options_tablet_phone_widget.dart';

class HomeTabLoadingTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  HomeTabLoadingTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeTabLoadingTabletPhoneWidget> createState() => _HomeTabLoadingTabletPhoneWidgetState();
}

class _HomeTabLoadingTabletPhoneWidgetState extends State<HomeTabLoadingTabletPhoneWidget> {
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
            child: Shimmer.fromColors(
              baseColor: AppColors.shimmerColor,
              highlightColor: AppColors.grayColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 3.w),
                              child: Container(
                                height: 6.5.h,
                                width: 6.5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.25.h),
                                ),
                                child: Center(
                                  child: ProfilePictureTabletPhoneWidget(
                                    fontSize: 18.sp,
                                    hasPicture: widget.controller.hasPicture,
                                    loadingPicture: widget.controller.loadingPicture,
                                    profileImagePath: widget.controller.profileImagePath,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 18.sp,
                                  width: 40.w,
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                                  ),
                                ),
                                Container(
                                  height: 17.sp,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.blackColor,
                                    borderRadius: BorderRadius.all(Radius.circular(9.sp)),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                                  itemCount: 2,
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
                                    return CardMainMenuTabletPhoneWidget(
                                      firstText: "",
                                      secondText: "",
                                      thirdText: "",
                                    );
                                  },
                                ),
                              ),
                              DotStepper(
                                dotCount: 2,
                                dotRadius: 1.h,
                                activeStep: widget.controller.activeStep,
                                shape: Shape.stadium,
                                spacing: 3.w,
                                indicator: Indicator.magnify,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 2.h, top: 2.h, right: 2.h),
                            child: ListView(
                              children: [
                                GroupMenuHomeTabletPhoneWidget(
                                  groupMenuId: "",
                                  titleGroupMenu:  "Ações Rápidas",
                                  menuOptionsList: [
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),
                                  ],
                                  mainMenuTabletPhoneController: widget.controller,
                                ),
                                GroupMenuHomeTabletPhoneWidget(
                                  groupMenuId: "",
                                  titleGroupMenu:  "Solicitações",
                                  menuOptionsList: [
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    MenuOptionsTabletPhoneWidget(
                                      id_option: "", text: "",
                                    ),
                                    SizedBox(width: PlatformType.isAndroid() ? 13.h : 14.h,),
                                  ],
                                  mainMenuTabletPhoneController: widget.controller,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}