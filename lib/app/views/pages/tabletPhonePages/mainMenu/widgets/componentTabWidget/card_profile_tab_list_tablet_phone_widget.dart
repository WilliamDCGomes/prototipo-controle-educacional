import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/newsAndEvents/page/news_and_events_tablet_phone_page.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/qrCodeScanner/page/qr_code_scanner_tablet_phone_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../../widgetsShared/text_widget.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../resetPassword/page/reset_password_tablet_phone_page.dart';
import '../../../shared/popups/logout_tablet_phone_popup.dart';

class CardProfileTabListTabletPhoneWidget extends StatelessWidget {
  final Widget iconCard;
  final String titleIconPath;
  final destinationsPages page;

  const CardProfileTabListTabletPhoneWidget(
      { Key? key,
        required this.iconCard,
        required this.titleIconPath,
        required this.page,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: SizedBox(
        height: 10.h,
        width: double.infinity,
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: (){
              switch(page){
                case destinationsPages.newsAndEvents:
                  Get.to(() => NewsAndEventsTabletPhonePage());
                  break;
                case destinationsPages.settings:

                  break;
                case destinationsPages.resetPassword:
                  Get.to(() => ResetPasswordTabletPhonePage());
                  break;
                case destinationsPages.connectToSmartWatch:
                  Get.to(() => QrCodeScannerTabletPhonePage());
                  break;
                case destinationsPages.logout:
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutTabletPhonePopup();
                    },
                  );
                  break;
              }
            },
            borderRadius: 1.h,
            componentPadding: EdgeInsets.all(.5.w),
            widgetCustom: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5.h,
                        child: Center(
                          child: iconCard,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: TextWidget(
                            titleIconPath,
                            textColor: AppColors.blackColor,
                            fontSize: 16.sp,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.purpleDefaultColor,
                        size: 3.h,
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