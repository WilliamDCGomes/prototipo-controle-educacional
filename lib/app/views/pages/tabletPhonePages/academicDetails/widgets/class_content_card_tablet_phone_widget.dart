import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/models/files.dart';
import '../../../../../utils/date_format_to_brazil.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class ClassContentCardTabletPhoneWidget extends StatelessWidget {
  final Files files;

  const ClassContentCardTabletPhoneWidget(
  {
    Key? key,
    required this.files,
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
        onTap: () => {

        },
        componentPadding: EdgeInsets.all(1.h),
        widgetCustom: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Paths.Icone_Pdf,
              height: 6.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: TextWidget(
                        "${files.name}.${files.type}",
                        textColor: AppColors.purpleDefaultColor,
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWidget(
                      DateFormatToBrazil.formatDate(files.lastChange),
                      textColor: AppColors.blackColor,
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.purpleDefaultColor,
                size: 3.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}