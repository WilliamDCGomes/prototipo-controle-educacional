import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/models/classes.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class ClassesCardWidget extends StatelessWidget {
  final Classes classes;
  final CurriculumDeliveryViewController curriculumDeliveryViewController;

  const ClassesCardWidget(
      { Key? key,
        required this.classes,
        required this.curriculumDeliveryViewController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.h),
      ),
      elevation: 3,
      child: TextButtonWidget(
        onTap: (){

        },
        componentPadding: EdgeInsets.all(1.h),
        widgetCustom: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  classes.className ?? "",
                  textColor: AppColors.blackColor,
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  DateFormatToBrazil.formatDate(classes.classDate),
                  textColor: AppColors.blackColor,
                  fontSize: 16.sp,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.purpleDefaultColor,
              size: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}