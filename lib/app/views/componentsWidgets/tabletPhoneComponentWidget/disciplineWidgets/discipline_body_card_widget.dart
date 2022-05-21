import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../stylePages/app_colors.dart';
import '../../rich_text_two_different_widget.dart';
import '../../text_widget.dart';

class DisciplineBodyCardWidget extends StatelessWidget {
  final String firstCardInformation;
  final String noteAverage;
  final bool? approved;

  const DisciplineBodyCardWidget(
      { Key? key,
        required this.firstCardInformation,
        required this.noteAverage,
        this.approved,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 5.h,
          width: 44.w,
          color: AppColors.grayAcademicCardColor,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
          child: Center(
            child: TextWidget(
              firstCardInformation,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: 5.h,
          width: 44.w,
          color: AppColors.grayAcademicCardColor,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: RichTextTwoDifferentWidget(
                    firstText: "Média: ",
                    firstTextColor: AppColors.blackColor,
                    firstTextFontWeight: FontWeight.normal,
                    firstTextSize: 15.sp,
                    secondText: noteAverage,
                    secondTextColor: AppColors.blackColor,
                    secondTextFontWeight: FontWeight.bold,
                    secondTextSize: 15.sp,
                    secondTextDecoration: TextDecoration.none,
                  ),
                ),
              ),
              getStatusNoteAverage(),
            ],
          ),
        ),
      ],
    );
  }

  Widget getStatusNoteAverage(){
    if(approved == null)
      return Center(
        child: Icon(
          Icons.info,
          color: AppColors.purpleDefaultColor,
          size: 2.4.h,
        ),
      );
    if(approved!)
      return Center(
        child: Icon(
          Icons.check_circle,
          color: AppColors.greenColor,
          size: 2.4.h,
        ),
      );
    return Center(
      child: FaIcon(
        FontAwesomeIcons.solidCircleXmark,
        color: AppColors.redColor,
        size: 2.h,
      ),
    );
  }
}