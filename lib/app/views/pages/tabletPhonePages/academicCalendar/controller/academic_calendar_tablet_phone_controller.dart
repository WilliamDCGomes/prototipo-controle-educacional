import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/base/models/academic_calendar.dart';
import 'package:projeto_tcc/base/services/academic_calendar_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../../../base/services/interfaces/iacademic_calendar_service.dart';
import '../../shared/popups/bottom_sheet_tablet_phone_popup.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../popup/academic_calendar_tablet_phone_popup.dart';

class AcademicCalendarTabletPhoneController extends GetxController {
  late List<AcademicCalendar> events;
  late RxBool loadingAnimation;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late CalendarController calendarController;
  late IAcademicCalendarService _academicCalendarService;

  AcademicCalendarTabletPhoneController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    events = <AcademicCalendar>[].obs;
    loadingAnimation = false.obs;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    calendarController = CalendarController();
    _academicCalendarService = AcademicCalendarService();
  }

  getDataSource() async {
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(milliseconds: 200));
      events = await _academicCalendarService.getEvents();
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
    }
    catch(e){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Não foi possível carregar o Calendário Acadêmico.",
          );
        },
      );
      Get.back();
    }
  }

  openAcademicCalendarPopup(AcademicCalendar _event){
    BottomSheetTabletPhonePopup.showAlert(
      Get.context!,
      AcademicCalendarTabletPhonePopup.getWidgetList(
        Get.context!,
        _event,
      ),
    );
  }
}