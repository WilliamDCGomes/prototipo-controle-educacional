import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../controllers/main-menu-tablet-phone-controller.dart';
import '../../../../style-pages/app-colors.dart';
import '../../../text-button-widget.dart';
import '../../../text-widget.dart';

class CardProfileTabListWidget extends StatelessWidget {
  final int id;
  final Widget iconCard;
  final String titleIconPath;
  final MainMenuTabletPhoneController mainMenuTabletPhoneController;

  const CardProfileTabListWidget(
      { Key? key,
        required this.id,
        required this.iconCard,
        required this.titleIconPath,
        required this.mainMenuTabletPhoneController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: 90.w,
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.5.h),
        ),
        elevation: 3,
        child: TextButtonWidget(
          onTap: () => mainMenuTabletPhoneController.cardProfileSelected(id),
          borderRadius: 2.5.h,
          componentPadding: EdgeInsets.all(.5.w),
          widgetCustom: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 6.h,
                      child: Center(
                        child: iconCard,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: TextWidget(
                          titleIconPath,
                          textColor: AppColors.blackColor,
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.purpleDefaultColor,
                        size: 4.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}