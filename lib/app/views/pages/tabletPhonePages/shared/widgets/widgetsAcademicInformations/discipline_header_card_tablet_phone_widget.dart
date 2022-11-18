import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_widget.dart';

class DisciplineHeaderCardTabletPhoneWidget extends StatelessWidget {
  final String disciplineName;
  final String disciplineWorkload;

  const DisciplineHeaderCardTabletPhoneWidget(
      { Key? key,
        required this.disciplineName,
        required this.disciplineWorkload,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purpleTabColor,
      height: 5.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextWidget(
                disciplineName,
                textColor: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                textDecoration: TextDecoration.none,
                maxLines: 1,
              ),
            ),
            Container(
              height: 3.h,
              width: 18.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(.5.h),
                color: AppColors.whiteColor,
              ),
              child: Center(
                child: TextWidget(
                  "$disciplineWorkload CH",
                  textColor: AppColors.orangeTextColor,
                  fontSize: 15.sp,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}