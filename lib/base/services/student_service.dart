import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/base/models/student.dart';
import 'interfaces/istudent_service.dart';

class StudentService implements IStudentService {
  Future<bool> sendNewStudent(Student newStudent) async {
    try {
      await FirebaseFirestore.instance.collection("student")
          .doc(newStudent.cpf)
          .set(newStudent.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Student?> getStudent(int ra) async {
    try {
      var lastRaRegistered = await FirebaseFirestore.instance.collection("student")
          .where("ra", isEqualTo: ra).get();
      if(lastRaRegistered.size > 0) {
        return Student.fromJsonFirebase(lastRaRegistered.docs.first.data());
      }
      return null;
    } catch (_) {
      return null;
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
      var verification = await FirebaseFirestore.instance.collection("student")
          .where("email", isEqualTo: email).get();
      return verification.size > 0;
    } catch (_) {
      return false;
    }
  }
}