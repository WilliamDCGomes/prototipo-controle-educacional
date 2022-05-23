import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/shared/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class CardCalendarInformationWidget extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final Color cardColor;

  const CardCalendarInformationWidget(
      { Key? key,
        required this.firstValue,
        required this.secondValue,
        required this.thirdValue,
        required this.cardColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: SizedBox(
        height: 15.h,
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.5.h),
          ),
          elevation: 3,
          child: Padding(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 3.h,
                            width: .8.h,
                            color: cardColor,
                          ),
                          Expanded(
                            child: TextWidget(
                              " $firstValue",
                              textColor: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: .8.h,
                          ),
                          Expanded(
                            child: TextWidget(
                              " $secondValue",
                              maxLines: 1,
                              fontSize: 16.sp,
                              textColor: AppColors.blackColor91Percent,
                              textAlign: TextAlign.start,
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
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Container(
                    height: 4.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h),
                      color: cardColor,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: Center(
                      child: TextWidget(
                        getHourValue(),
                        maxLines: 1,
                        textColor: AppColors.whiteColor,
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.w,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: cardColor,
                    size: 3.5.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getHourValue(){
    if(thirdValue.length < 5){
      var hourValue = thirdValue.split(":");
      if(hourValue[0].length < 2){
        hourValue[0] = "0${hourValue[0]}";
      }
      if(hourValue[1].length < 2){
        hourValue[1] = "0${hourValue[1]}";
      }
      return "${hourValue[0]}:${hourValue[1]}";
    }
    return thirdValue;
  }
}