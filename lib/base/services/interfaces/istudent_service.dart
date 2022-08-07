import '../../models/student.dart';

abstract class IStudentService {
  Future<bool> sendNewStudent(Student newStudent);

  Future<bool> saveEmail(String email);

  Future<bool> verificationStudentExists(String cpf);

  Future<bool> verificationEmailExists(String email);
}