import '../../models/discipline_periods.dart';

abstract class IDisciplinePeriodsService {
  Future<List<DisciplinePeriods>> getDisciplinePeriods(String institutionId);
}