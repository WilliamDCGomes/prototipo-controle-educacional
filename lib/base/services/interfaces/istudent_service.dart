import '../../models/student.dart';

abstract class IStudentService {
  Future<bool> sendNewStudent(Student newStudent);
  Future<bool> verificationStudentExists(String cpf);
}