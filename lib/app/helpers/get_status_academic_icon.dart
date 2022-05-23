import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../views/stylePages/app_colors.dart';

class GetStatusAcademicIcon {
  static Widget getStatusNoteAverage(bool? approved){
    if(approved == null)
      return Center(
        child: Icon(
          Icons.info,
          color: AppColors.purpleDefaultColor,
          size: 2.4.h,
        ),
      );
    if(approved)
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