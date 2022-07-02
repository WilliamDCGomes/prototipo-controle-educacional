import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class BottomSelectPaymentFormWidget extends StatefulWidget {
  late final String cardTitle;
  late final RxBool cardSelected;

  BottomSelectPaymentFormWidget({
    Key? key,
    required this.cardTitle,
    required this.cardSelected,
  }) : super(key: key);

  @override
  State<BottomSelectPaymentFormWidget> createState() => _BottomSelectPaymentFormWidgetState();
}

class _BottomSelectPaymentFormWidgetState extends State<BottomSelectPaymentFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 45.w,
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          color: widget.cardSelected.value ? AppColors.orangeColor : AppColors.grayAcademicCardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextWidget(
                widget.cardTitle,
                textColor: widget.cardSelected.value ? AppColors.whiteColor : AppColors.blackColor91Percent,
                fontSize: 14.5.sp,
                textAlign: TextAlign.start,
                maxLines: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 2.h,
              width: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              padding: EdgeInsets.all(.5.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(1.h),
              ),
              child: Container(
                height: 1.h,
                width: 1.h,
                decoration: BoxDecoration(
                  color: widget.cardSelected.value ? AppColors.orangeColor : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(.5.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}