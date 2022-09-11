import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_tcc/app/utils/paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/news_and_events_view_controller.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/popups/bottom_sheet_tablet_phone_popup.dart';
import '../popup/news_and_events_tablet_phone_popup.dart';

class NewsAndEventsCardTabletPhoneWidget extends StatelessWidget {
  final NewsAndEventsViewController newsAndEventsViewController;

  const NewsAndEventsCardTabletPhoneWidget(
      { Key? key,
        required this.newsAndEventsViewController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 1.h),
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
        elevation: 3,
        child: TextButtonWidget(
          onTap: (){
            BottomSheetTabletPhonePopup.showAlert(
              context,
              NewsAndEventsTabletPhonePopup.getWidgetList(
                context,
                newsAndEventsViewController,
              ),
            );
          },
          borderRadius: 1.h,
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
                            newsAndEventsViewController.newEventName,
                            textColor: AppColors.purpleDefaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                          Expanded(
                            child: Center(
                              child: TextWidget(
                                newsAndEventsViewController.newEventDescription,
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
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: TextWidget(
                                    "${newsAndEventsViewController.newEventDate} às ${newsAndEventsViewController.newEventHourStart}",
                                    maxLines: 1,
                                    textColor: AppColors.blackColor,
                                    fontSize: 17.sp,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.bold,
                                  ),
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
    );
  }
}