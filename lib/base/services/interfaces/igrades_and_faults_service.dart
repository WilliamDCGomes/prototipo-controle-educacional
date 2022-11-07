import 'package:projeto_tcc/base/models/grades_and_faults.dart';

abstract class IGradesAndFaultsService {
  Future<List<GradesAndFaults>> getGradesAndFaults(String studentId, String courseId, String educationInstitutionId, String semester);
}