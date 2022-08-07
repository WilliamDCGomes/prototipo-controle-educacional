import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/base/models/student.dart';
import 'interfaces/istudent_service.dart';

class StudentService implements IStudentService {
  Future<bool> sendNewStudent(Student newStudent) async {
    try {
      await FirebaseFirestore.instance.collection("student")
          .doc(newStudent.cpf)
          .set(newStudent.toJson());
      return await saveEmail(newStudent.email);
    } catch (_) {
      return false;
    }
  }

  Future<bool> saveEmail(String email) async {
    try {
      await FirebaseFirestore.instance.collection("registered_emails")
          .doc(email)
          .set({});
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> verificationStudentExists(String cpf) async {
    try {
      var verification = await FirebaseFirestore.instance.collection("student")
          .doc(cpf).get();
      return verification.exists;
    } catch (_) {
      return false;
    }
  }

  Future<bool> verificationEmailExists(String email) async {
    try {
      var verification = await FirebaseFirestore.instance.collection("registered_emails")
          .doc(email).get();
      return verification.exists;
    } catch (_) {
      return false;
    }
  }
}