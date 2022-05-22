import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../base/models/meeting.dart';

class AcademicCalendarController extends GetxController {
  late CalendarController calendarController;

  AcademicCalendarController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    calendarController = CalendarController();
  }

  List<Meeting> getDataSource() {
    final List<Meeting> meetings = [
      Meeting(
        "Prova de Cálculo",
        DateTime.now(),
        DateTime.now().add(Duration(days: 1)),
        false,
      ),
      Meeting(
        "Maratona de Programação",
        DateTime.now(),
        DateTime.now(),
        false,
      ),
      Meeting(
        "Visita no Google",
        DateTime.now().add(Duration(days: 7)),
        DateTime.now().add(Duration(days: 8)),
        false,
      ),
      Meeting(
        "Palesta Industria 4.0",
        DateTime.now().add(Duration(days: -2)),
        DateTime.now(),
        false,
      ),
    ];
    return meetings;
  }
}