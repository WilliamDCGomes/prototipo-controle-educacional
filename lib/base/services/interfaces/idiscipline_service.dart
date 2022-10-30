import '../../models/discipline.dart';

abstract class IDisciplineService {
  Future<String> getDisciplineId(String name);

  Future<String> getDisciplineName(String disciplineId);

  Future<List<Discipline>> getDisciplines(String educationalInstitutionId, String courseId, String period);
}