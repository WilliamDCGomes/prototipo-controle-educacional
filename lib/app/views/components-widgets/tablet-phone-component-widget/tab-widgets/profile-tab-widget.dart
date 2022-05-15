import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/main-menu-tablet-phone-controller.dart';
import '../../../../helpers/paths.dart';
import '../../../style-pages/app-colors.dart';
import '../../text-button-widget.dart';
import '../../text-widget.dart';

class ProfileTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  ProfileTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileTabWidget> createState() => _ProfileTabWidgetState();
}

class _ProfileTabWidgetState extends State<ProfileTabWidget> {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                  ),
                  Container(
                    height: 14.h,
                    width: 14.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          7.h),
                      color: AppColors.purpleDefaultColor,
                    ),
                    child: Obx(
                          () =>
                      widget.controller.hasPicture.value ?
                      Image.asset(
                          ""
                      ) :
                      Center(
                        child: TextWidget(
                          widget.controller.nameInitials,
                          textColor: AppColors.lightGrayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: .5.h),
                    child: TextButtonWidget(
                      onTap: () {

                      },
                      height: 4.h,
                      componentPadding: EdgeInsets.zero,
                      widgetCustom: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 3.w),
                            child: TextWidget(
                              "William Douglas, 24",
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
                  ),
                  TextWidget(
                    "Ciência da Computação",
                    textColor: AppColors.blackColor,
                    fontSize: 17.sp,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: SizedBox(
                      height: 54.h,
                      child: ListView.builder(
                          itemCount: widget.controller.cardProfileTabList.length,
                          itemBuilder: (context, index){
                            return widget.controller.cardProfileTabList.elementAt(index);
                          }
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
