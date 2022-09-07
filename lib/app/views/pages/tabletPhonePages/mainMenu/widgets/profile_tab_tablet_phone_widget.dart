import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/logged_user.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../userProfile/page/user_profile_tablet_phone_page.dart';
import '../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/reorderer_lists.dart';
import '../../../../stylePages/app_colors.dart';

class ProfileTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  ProfileTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileTabTabletPhoneWidget> createState() => _ProfileTabTabletPhoneWidgetState();
}

class _ProfileTabTabletPhoneWidgetState extends State<ProfileTabTabletPhoneWidget> {
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
                  onTap: () => Get.to(() => UserProfileTablePhonePage()),
                  borderRadius: 2.h,
                  widgetCustom: Column(
                    children: [
                      Container(
                        height: 14.h,
                        width: 14.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.h),
                          color: AppColors.purpleDefaultColor,
                        ),
                        child: Obx(
                        () => widget.controller.hasPicture.value ?
                          Image.asset(
                              ""
                          ) :
                          Center(
                            child: TextWidget(
                              LoggedUser.nameInitials,
                              textColor: AppColors.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
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
                      TextWidget(
                        LoggedUser.courseName,
                        textColor: AppColors.blackColor,
                        fontSize: 17.sp,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: ReorderableListView.builder(
                      itemCount: widget.controller.cardProfileTabList.length,
                      itemBuilder: (context, index){
                        return Container(
                          key: Key("$index"),
                          child: widget.controller.cardProfileTabList[index],
                        );
                      },
                      onReorder: (oldIndex, newIndex) {
                        var newList = ReorderListHelper.reorderList(
                          oldIndex,
                          newIndex,
                          widget.controller.cardProfileTabList,
                        );
                        //TODO Fazer um método para salvar a nova lista
                      },
                    ),
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
