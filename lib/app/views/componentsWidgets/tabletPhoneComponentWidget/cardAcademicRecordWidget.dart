import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../helpers/paths.dart';
import '../../stylePages/appColors.dart';
import '../textButtonWidget.dart';
import '../textWidget.dart';

class CardAcademicRecordWidget extends StatelessWidget {
  final String yearValueText;
  final String semesterValueText;

  const CardAcademicRecordWidget(
      { Key? key,
        required this.yearValueText,
        required this.semesterValueText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 18.h,
        width: 95.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
          color: AppColors().whiteColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: .5.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: 66.w,
                      child: TextWidget(
                        yearValueText,
                        textColor: AppColors().purpleDefaultColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.sp,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Center(
                    child: TextWidget(
                      semesterValueText,
                      maxLines: 1,
                      fontSize: 19.sp,
                      textColor: AppColors().purpleDefaultColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButtonWidget(
                    onTap: () {

                    },
                    widgetCustom: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Paths().svgsPath + "Icone_Copiar.svg",
                          width: 2.h,
                        ),
                        TextWidget(
                          " Ver Histórico Acadêmico",
                          maxLines: 1,
                          textColor: AppColors().blueLinkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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