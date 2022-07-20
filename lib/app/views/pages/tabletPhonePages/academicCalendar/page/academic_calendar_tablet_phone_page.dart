import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/academic_calendar_tablet_phone_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../widgetsShared/calendar_widget.dart';
import '../../../../stylePages/app_colors.dart';

class AcademicCalendarTabletPhonePage extends StatefulWidget {
  const AcademicCalendarTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<AcademicCalendarTabletPhonePage> createState() => _AcademicCalendarTabletPhonePageState();
}

class _AcademicCalendarTabletPhonePageState extends State<AcademicCalendarTabletPhonePage> {
  late AcademicCalendarTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(AcademicCalendarTabletPhoneController(), tag: "academic-calendar-tablet-phone-controller");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    Paths.Ilustracao_Topo,
                    width: 25.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TitleWithBackButtonTabletPhoneWidget(
                                title: "Calendário Acadêmico",
                              ),
                            ),
                            TextButtonWidget(
                              onTap: () {

                              },
                              height: 6.5.w,
                              width: 7.w,
                              componentPadding: EdgeInsets.all(.5.w),
                              widgetCustom: Center(
                                child: Icon(
                                  Icons.download_rounded,
                                  size: 6.w,
                                  color: AppColors.purpleDefaultColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: PlatformType.isTablet(context) ? 9.h : 7.h,
                          bottom: 1.h,
                        ),
                        padding: EdgeInsets.only(top: 4.h, bottom: 3.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                          color: AppColors.purpleDefaultColor,
                        ),
                        child: TextWidget(
                          "Visualize os Eventos no Calendário Acadêmico",
                          textColor: AppColors.whiteColor,
                          fontSize: 18.sp,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: CalendarWidget(
                          dataSource: controller.getDataSource(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: ButtonWidget(
                          hintText: "COMPARTILHAR",
                          fontWeight: FontWeight.bold,
                          widthButton: 100.w,
                          backgroundColor: AppColors.orangeColor,
                          borderColor: AppColors.orangeColor,
                          textColor: AppColors.whiteColor,
                          onPressed: () {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    margin: EdgeInsets.only(
                      top: PlatformType.isTablet(context) ? 14.h : 12.h,
                      right: 2.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5.h),
                      color: AppColors.purpleDefaultColor,
                    ),
                    child: Image.asset(
                      Paths.Icone_Exibicao_Calendario_Academico,
                      height: 5.h,
                      width: 5.h,
                    ),
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
