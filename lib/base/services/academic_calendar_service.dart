import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/base/models/academic_calendar.dart';
import 'interfaces/iacademic_calendar_service.dart';

class AcademicCalendarService implements IAcademicCalendarService {
  Future<List<AcademicCalendar>> getEvents() async {
    try {
      var allEvents = await FirebaseFirestore.instance
          .collection("academic_calendar")
          .get()
          .timeout(Duration(minutes: 2));

      if(allEvents.size > 0){
        List<AcademicCalendar> events = <AcademicCalendar>[];
        for(var event in allEvents.docs){
          events.add(AcademicCalendar.fromJsonFirebase(event.data()));
        }

        return events;
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}