import 'package:projeto_tcc/base/models/academic_calendar.dart';

abstract class IAcademicCalendarService {
  Future<List<AcademicCalendar>> getEvents();
}