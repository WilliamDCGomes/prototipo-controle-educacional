import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class InformationStudentCardTabletPhoneWidget extends StatelessWidget {
  final String cardNumber;
  final String raNumber;
  final String nameStudent;
  final String validateCard;

  const InformationStudentCardTabletPhoneWidget(
      { Key? key,
        required this.cardNumber,
        required this.raNumber,
        required this.nameStudent,
        required this.validateCard,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: PlatformType.isPhone(context) ? 24.h : 27.h,
        width: 90.w,
        padding: EdgeInsets.all(PlatformType.isPhone(context) ? 1.h : 0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                top: PlatformType.isPhone(context) ? 4.h : 6.h,
                right: 2.w,
              ),
              child: TextWidget(
                cardNumber,
                textColor: AppColors.whiteColor,
                fontSize: 17.sp,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                top: PlatformType.isPhone(context) ? 11.5.h : 14.h,
                right: 2.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    "RA:",
                    textColor: AppColors.whiteColor,
                    fontSize: 14.sp,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                  TextWidget(
                    raNumber,
                    textColor: AppColors.whiteColor,
                    fontSize: 15.sp,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                top: PlatformType.isPhone(context) ? 17.h : 20.h,
                right: 2.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "Nome:",
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      TextWidget(
                        nameStudent,
                        textColor: AppColors.whiteColor,
                        fontSize: 15.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "Validade:",
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      TextWidget(
                        validateCard,
                        textColor: AppColors.whiteColor,
                        fontSize: 15.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}