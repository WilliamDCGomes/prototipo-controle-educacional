import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/base/services/interfaces/istudent_request_service.dart';
import '../models/student_request.dart';

class StudentRequestService implements IStudentRequestService {
  Future<bool> sendNewRequest(StudentRequest newRequest) async {
    try {
      await FirebaseFirestore.instance
          .collection("student_request")
          .doc(newRequest.id)
          .set(newRequest.toJson())
          .timeout(Duration(minutes: 2));

      return true;
    } catch (_) {
      return false;
    }
  }
}