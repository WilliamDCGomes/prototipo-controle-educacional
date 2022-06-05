import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../../../base/viewController/meeting_view_controller.dart';

class AcademicCalendarController extends GetxController {
  late CalendarController calendarController;

  AcademicCalendarController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    calendarController = CalendarController();
  }

  List<MeetingViewController> getDataSource() {
    final List<MeetingViewController> meetings = [
      MeetingViewController(
        "Prova de Cálculo",
        DateTime.now(),
        DateTime.now().add(Duration(days: 1)),
        false,
      ),
      MeetingViewController(
        "Maratona de Programação",
        DateTime.now(),
        DateTime.now(),
        false,
      ),
      MeetingViewController(
        "Visita no Google",
        DateTime.now().add(Duration(days: 7)),
        DateTime.now().add(Duration(days: 8)),
        false,
      ),
      MeetingViewController(
        "Palesta Industria 4.0",
        DateTime.now().add(Duration(days: -2)),
        DateTime.now(),
        false,
      ),
    ];
    return meetings;
  }
}