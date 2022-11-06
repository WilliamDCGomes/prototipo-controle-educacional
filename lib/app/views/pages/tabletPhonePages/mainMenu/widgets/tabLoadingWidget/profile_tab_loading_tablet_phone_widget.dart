import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../utils/logged_user.dart';
import '../../../../../../utils/paths.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../../widgetsShared/text_widget.dart';
import '../../../shared/widgets/profile_picture_tablet_phone_widget.dart';
import '../../../userProfile/page/user_profile_tablet_phone_page.dart';
import '../../controller/main_menu_tablet_phone_controller.dart';

class ProfileTabLoadingTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  ProfileTabLoadingTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileTabLoadingTabletPhoneWidget> createState() => _ProfileTabLoadingTabletPhoneWidgetState();
}

class _ProfileTabLoadingTabletPhoneWidgetState extends State<ProfileTabLoadingTabletPhoneWidget> {
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
          Shimmer.fromColors(
            baseColor: AppColors.shimmerColor,
            highlightColor: AppColors.grayColor,
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          "Perfil",
                          textColor: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                        ),
                        SvgPicture.asset(
                          Paths.Logo_Pce_Home,
                          width: 15.w,
                        ),
                      ],
                    ),
                  ),
                  TextButtonWidget(
                    onTap: () => Get.to(() => UserProfileTablePhonePage(mainMenuController: widget.controller,)),
                    borderRadius: 2.h,
                    widgetCustom: Column(
                      children: [
                        ProfilePictureTabletPhoneWidget(
                          hasPicture: widget.controller.hasPicture,
                          loadingPicture: widget.controller.loadingPicture,
                          profileImagePath: widget.controller.profileImagePath,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h, bottom: .5.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 3.w),
                                child: TextWidget(
                                  LoggedUser.nameAndLastName + LoggedUser.userAge,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SvgPicture.asset(
                                Paths.Icone_Editar,
                                height: 2.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 18.sp,
                          width: 40.w,
                          margin: EdgeInsets.only(bottom: 1.h),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: ListView.builder(
                        itemCount: widget.controller.cardProfileTabList.length,
                        itemBuilder: (context, index){
                          return Container(
                            key: Key("$index"),
                            child: widget.controller.cardProfileTabList[index],
                          );
                        },
                      ),
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