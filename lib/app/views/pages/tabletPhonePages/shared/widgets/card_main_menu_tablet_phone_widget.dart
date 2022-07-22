import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import 'information_container_tablet_phone_widget.dart';

class CardMainMenuTabletPhoneWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  final String? fourthText;
  final bool? showSeparator;

  const CardMainMenuTabletPhoneWidget(
      { Key? key,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
        this.fourthText,
        this.showSeparator,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformationContainerTabletPhoneWidget(
      iconPath: Paths.Icone_Exibicao_Home,
      textColor: AppColors.whiteColor,
      backgroundColor: AppColors.purpleDefaultColor,
      informationText: "",
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h,),
      customContainer: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: .5.h,
          ),
          TextWidget(
            firstText,
            textColor: AppColors.whiteColor,
            fontSize: 18.sp,
            textAlign: TextAlign.start,
            maxLines: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: TextWidget(
              secondText,
              fontWeight: FontWeight.bold,
              maxLines: 1,
              textColor: AppColors.whiteColor,
              fontSize: 20.sp,
              textAlign: TextAlign.start,
            ),
          ),
          Visibility(
            visible: showSeparator ?? false,
            replacement: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 73.w,
                    child: TextWidget(
                      thirdText,
                      maxLines: 1,
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        thirdText,
                        maxLines: 1,
                        textColor: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Container(
                          height: 3.h,
                          width: .5.w,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: TextWidget(
                          fourthText ?? "",
                          maxLines: 1,
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
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