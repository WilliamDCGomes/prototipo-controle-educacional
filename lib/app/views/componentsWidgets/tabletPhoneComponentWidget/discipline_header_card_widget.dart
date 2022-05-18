import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/app_colors.dart';
import '../text_widget.dart';

class DisciplineHeaderCardWidget extends StatelessWidget {
  final String disciplineCode;
  final String disciplineName;
  final String disciplineWorkload;

  const DisciplineHeaderCardWidget(
      { Key? key,
        required this.disciplineCode,
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              "$disciplineCode -",
              textColor: AppColors.whiteColor,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
              maxLines: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: TextWidget(
                disciplineName,
                textColor: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            Expanded(
              child: SizedBox(),
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