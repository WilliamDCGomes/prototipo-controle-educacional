import '../../models/student.dart';

abstract class IStudentService {
  Future<bool> sendNewStudent(Student newStudent);

  Future<Student?> getStudent(int ra);

  Future<bool> verificationStudentExists(String cpf);

  Future<bool> verificationEmailExists(String email);
}