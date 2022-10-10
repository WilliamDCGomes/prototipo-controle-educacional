import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/models/academic_calendar.dart';
import '../../../../../../base/services/academic_calendar_service.dart';
import '../../../../../../base/services/interfaces/iacademic_calendar_service.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class NewsAndEventsTabletPhoneController extends GetxController {
  late TextEditingController searchNewsAndEventsController;
  late List<AcademicCalendar> newsAndEvents;
  late List<AcademicCalendar> newsAndEventsOnScreen;
  late RxBool loadingAnimation;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late IAcademicCalendarService _academicCalendarService;

  NewsAndEventsTabletPhoneController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    searchNewsAndEventsController = TextEditingController();
    loadingAnimation = false.obs;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    newsAndEvents = <AcademicCalendar>[];
    newsAndEventsOnScreen = <AcademicCalendar>[];
    _academicCalendarService = AcademicCalendarService();
  }

  getDataSource() async {
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(milliseconds: 200));
      newsAndEvents = await _academicCalendarService.getNewsAndEvents();
      newsAndEventsOnScreen = newsAndEvents;
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
    }
    catch(e){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Não foi possível carregar as Notícias e Eventos.",
          );
        },
      );
      Get.back();
    }
  }

  searchNewsAndEvents(String name) {
    try{
      if(newsAndEvents.isNotEmpty){
        if(name.isNotEmpty){
          newsAndEventsOnScreen = newsAndEvents.where(
            (element) => element.eventName.toLowerCase().startsWith(name.toLowerCase())
          ).toList();
        }
        else{
          newsAndEventsOnScreen = newsAndEvents;
        }
      }
    }
    catch(_){
      newsAndEvents = <AcademicCalendar>[];
      newsAndEventsOnScreen = <AcademicCalendar>[];
    }
  }
}