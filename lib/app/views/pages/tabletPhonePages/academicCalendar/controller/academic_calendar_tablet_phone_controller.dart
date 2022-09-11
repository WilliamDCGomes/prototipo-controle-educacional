import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../../../base/viewController/meeting_view_controller.dart';
import '../../shared/popups/bottom_sheet_tablet_phone_popup.dart';
import '../popup/academic_calendar_tablet_phone_popup.dart';

class AcademicCalendarTabletPhoneController extends GetxController {
  late CalendarController calendarController;

  AcademicCalendarTabletPhoneController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    calendarController = CalendarController();
  }

  List<MeetingViewController> getDataSource() {
    final List<MeetingViewController> meetings = [
      MeetingViewController(
        "Prova de Cálculo",
        "Agendamento para a prova de Cálculo remarcada",
        "Faculdades Integradas de Bauru",
        DateTime.now(),
        DateTime.now().add(Duration(days: 1)).add(Duration(hours: 2)),
        DateTime.now(),
        false,
      ),
      MeetingViewController(
        "Maratona de Programação",
        "Evento para incentivar a programação competitiva entre os alunos",
        "Uiversidade Paulista",
        DateTime.now(),
        DateTime.now().add(Duration(hours: 6)),
        DateTime.now(),
        false,
      ),
      MeetingViewController(
        "Visita no Google",
        "Visita técnica ao escritório do Google com os alunos de Ciência da Computação",
        "São Paulo",
        DateTime.now().add(Duration(days: 7)),
        DateTime.now().add(Duration(days: 8)).add(Duration(hours: 2)),
        DateTime.now(),
        false,
      ),
      MeetingViewController(
        "Palesta Industria 4.0",
        "Palesta sobre a Industria 4.0, com ex-aluno da universidade",
        "Faculdades Integradas de Bauru",
        DateTime.now().add(Duration(days: -2)),
        DateTime.now().add(Duration(hours: 1)),
        DateTime.now(),
        false,
      ),
    ];
    return meetings;
  }

  openAcademicCalendarPopup(MeetingViewController _meetingViewController){
    BottomSheetTabletPhonePopup.showAlert(
      Get.context!,
      AcademicCalendarTabletPhonePopup.getWidgetList(
        Get.context!,
        _meetingViewController,
      ),
    );
  }
}