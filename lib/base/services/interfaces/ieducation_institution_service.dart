import 'package:projeto_tcc/base/models/education_institution.dart';

abstract class IEducationInstitutionService {
  Future<List<EducationInstitution>> getEducationInstitutions();

  Future<String> getEducationInstitutionNameById(String id);
}