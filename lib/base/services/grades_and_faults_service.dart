import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/grades_and_faults.dart';
import 'interfaces/igrades_and_faults_service.dart';

class GradesAndFaultsService implements IGradesAndFaultsService {
  Future<List<GradesAndFaults>> getGradesAndFaults(String studentId, String courseId, String educationInstitutionId, String semester) async {
    try {
      List<GradesAndFaults> gradesAndFaultsList = <GradesAndFaults>[];
      var gradesAndFaults = await FirebaseFirestore.instance
          .collection("grades_and_faults")
          .where("studentId", isEqualTo: studentId)
          .where("courseId", isEqualTo: courseId)
          .where("educationInstitutionId", isEqualTo: educationInstitutionId)
          .where("semester", isEqualTo: semester)
          .get()
          .timeout(Duration(minutes: 2));

      if(gradesAndFaults.size > 0){
        for(var gradeAndFault in gradesAndFaults.docs){
          gradesAndFaultsList.add(GradesAndFaults.fromJsonFirebase(gradeAndFault.data()));
        }
      }

      return gradesAndFaultsList;
    } catch (_) {
      return [];
    }
  }

  Future<List<GradesAndFaults>> getAllGradesAndFaults(String studentId, String courseId, String educationInstitutionId) async {
    try {
      List<GradesAndFaults> gradesAndFaultsList = <GradesAndFaults>[];
      var gradesAndFaults = await FirebaseFirestore.instance
          .collection("grades_and_faults")
          .where("studentId", isEqualTo: studentId)
          .where("courseId", isEqualTo: courseId)
          .where("educationInstitutionId", isEqualTo: educationInstitutionId)
          .get()
          .timeout(Duration(minutes: 2));

      if(gradesAndFaults.size > 0){
        for(var gradeAndFault in gradesAndFaults.docs){
          gradesAndFaultsList.add(GradesAndFaults.fromJsonFirebase(gradeAndFault.data()));
        }
      }

      return gradesAndFaultsList;
    } catch (_) {
      return [];
    }
  }
}