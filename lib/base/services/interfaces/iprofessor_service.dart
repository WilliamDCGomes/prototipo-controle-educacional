abstract class IProfessorService {
  Future<String> getProfessorName(String professorId);

  Future<String> getProfessorId(String educationInstitutionId, String courseId, String id_discipline);
}