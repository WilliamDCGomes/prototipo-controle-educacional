import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/models/classes.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';
import '../pages/class_content_tablet_phone_page.dart';

class ClassesCardTabletPhoneWidget extends StatelessWidget {
  final Classes classes;

  const ClassesCardTabletPhoneWidget(
      { Key? key,
        required this.classes,
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
        onTap: () => Get.to(() => ClassContentTabletPhonePage(classes: classes,)),
        componentPadding: EdgeInsets.all(1.h),
        widgetCustom: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: TextWidget(
                    classes.className ?? "",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                  ),
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