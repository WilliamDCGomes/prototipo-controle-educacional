import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_tcc/app/helpers/paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class NewsAndEventsCardWidget extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final Function()? onTap;

  const NewsAndEventsCardWidget(
      { Key? key,
        required this.firstValue,
        required this.secondValue,
        required this.thirdValue,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.w, 0.h, 2.w, 1.h),
      child: SizedBox(
        height: 17.h,
        width: 90.w,
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.5.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: onTap,
            borderRadius: 2.5.h,
            componentPadding: EdgeInsets.all(.5.w),
            widgetCustom: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: .2.h,
                            ),
                            TextWidget(
                              firstValue,
                              textColor: AppColors.purpleDefaultColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                            Expanded(
                              child: Center(
                                child: TextWidget(
                                  secondValue,
                                  maxLines: 2,
                                  fontSize: 17.sp,
                                  textColor: AppColors.blackColor,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: AppColors.purpleDefaultColor,
                                  size: 2.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: TextWidget(
                                    thirdValue,
                                    maxLines: 1,
                                    textColor: AppColors.blackColor,
                                    fontSize: 17.sp,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: .2.h,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: SvgPicture.asset(
                          Paths.Icone_Noticias_Eventos,
                          height: 8.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}