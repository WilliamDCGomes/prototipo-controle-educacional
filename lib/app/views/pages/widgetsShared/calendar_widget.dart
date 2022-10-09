import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_tcc/base/models/academic_calendar.dart';
import 'package:projeto_tcc/base/viewController/meeting_data_source_view_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../stylePages/app_colors.dart';
import '../tabletPhonePages/shared/widgets/card_calendar_information_tablet_phone_widget.dart';

class CalendarWidget extends StatefulWidget {
  final List<AcademicCalendar> dataSource;

  const CalendarWidget({
    Key? key,
    required this.dataSource,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('pt-BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: SfCalendar(
        dataSource: MeetingDataSourceViewController(widget.dataSource),
        initialSelectedDate: DateTime.now(),
        view: CalendarView.month,
        showNavigationArrow: true,
        allowAppointmentResize: true,
        cellBorderColor: AppColors.transparentColor,
        todayHighlightColor: AppColors.purpleDefaultColor,
        backgroundColor: AppColors.transparentBackgroundColor,
        scheduleViewSettings: ScheduleViewSettings(
          appointmentItemHeight: 2.h,
        ),
        todayTextStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        selectionDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.transparentColor,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            width: .5.w,
            color: AppColors.purpleDefaultColor,
          ),
        ),
        monthViewSettings: MonthViewSettings(
          appointmentDisplayCount: 5,
          showAgenda: true,
          agendaItemHeight: 10.h,
          agendaStyle: AgendaStyle(
            appointmentTextStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          monthCellStyle: MonthCellStyle(
            textStyle: getDefaultTextStyle(),
            trailingDatesTextStyle: getDefaultTextStyle(),
            leadingDatesTextStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor91Percent,
            ),
            backgroundColor: AppColors.transparentColor,
            todayBackgroundColor: AppColors.transparentBackgroundColor,
            leadingDatesBackgroundColor: AppColors.transparentBackgroundColor,
            trailingDatesBackgroundColor: AppColors.transparentBackgroundColor,
          ),
        ),
        appointmentBuilder: (context, calendarAppointmentDetails){
          return CardCalendarInformationTabletPhoneWidget(
            events: calendarAppointmentDetails.appointments.first,
          );
        },
      ),
    );
  }

  TextStyle getDefaultTextStyle(){
    return TextStyle(
      color: AppColors.purpleDefaultColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }
}
