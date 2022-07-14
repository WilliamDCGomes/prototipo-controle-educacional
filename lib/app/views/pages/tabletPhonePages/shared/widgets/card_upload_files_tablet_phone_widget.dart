import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class CardUploadFilesTabletPhoneWidget extends StatelessWidget {
  final Color? cardColor;
  final EdgeInsets? cardMargin;

  const CardUploadFilesTabletPhoneWidget(
      { Key? key,
        this.cardColor,
        this.cardMargin,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cardMargin,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(1.h),
        ),
      ),
      child: TextButtonWidget(
        onTap: (){

        },
        borderRadius: 1.h,
        componentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
        widgetCustom: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Paths.Icon_Upload,
              height: 6.h,
              color: cardColor,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: TextWidget(
                        "ADICIONAR ARQUIVOS",
                        textColor: AppColors.purpleDefaultColor,
                        fontSize: 17.sp,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWidget(
                      "Tipo de arquivos aceitos: .jpg, .doc, .png, .pdf",
                      textColor: AppColors.blackColor,
                      fontSize: 15.sp,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}