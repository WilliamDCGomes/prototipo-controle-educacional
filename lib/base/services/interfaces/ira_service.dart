abstract class IRaService {
  Future<int> createNewRA(String studentId, String educationInstitutionId);

  Future<bool> checkIfExistDuplicateRa(int ra);

  Future<bool> deleteDuplicateRa(String docId);
}