import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/base/models/discipline.dart';
import 'interfaces/idiscipline_service.dart';

class DisciplineService implements IDisciplineService {
  Future<String> getDisciplineId(String name) async {
    try {
      var disciplinesId = await FirebaseFirestore.instance
          .collection("disciplines")
          .where("name", isEqualTo: name)
          .get()
          .timeout(Duration(minutes: 2));

      if(disciplinesId.size > 0) {
        return disciplinesId.docs.first["id"];
      }
      return "";
    }
    catch (_) {
      return "";
    }
  }

  Future<String> getDisciplineName(String disciplineId) async {
    try {
      var disciplinesId = await FirebaseFirestore.instance
          .collection("disciplines")
          .where("id", isEqualTo: disciplineId)
          .get()
          .timeout(Duration(minutes: 2));

      if(disciplinesId.size > 0) {
        return disciplinesId.docs.first["name"];
      }
      return "";
    }
    catch (_) {
      return "";
    }
  }

  Future<Discipline?> getDiscipline(String disciplineId, String educationalInstitutionId, String courseId) async {
    try {
      var courses = await FirebaseFirestore.instance
          .collection("educational_institution")
          .where("id", isEqualTo: educationalInstitutionId)
          .get()
          .timeout(Duration(minutes: 2));

      if(courses.size > 0) {
        var course = courses.docs.first["courses"];
        for(var item in course){
          if(item["id_course"] == courseId){
            for(var discipline in item["disciplines"]){
              var disc = Discipline.fromJsonFirebase(discipline);
              if(disc.id == disciplineId){
                return disc;
              }
            }
            break;
          }
        }
      }
      return null;
    }
    catch (_) {
      return null;
    }
  }

  Future<List<Discipline>> getDisciplines(String educationalInstitutionId, String courseId, String period) async {
    try {
      List<Discipline> disciplines = <Discipline>[];
      var courses = await FirebaseFirestore.instance
          .collection("educational_institution")
          .where("id", isEqualTo: educationalInstitutionId)
          .get()
          .timeout(Duration(minutes: 2));

      if(courses.size > 0) {
        var course = courses.docs.first["courses"];
        for(var item in course){
          if(item["id_course"] == courseId){
            for(var discipline in item["disciplines"]){
              var disc = Discipline.fromJsonFirebase(discipline);
              if(disc.disciplinesPeriod.any((element) => element.moment == period)){
                disc.disciplinesPeriod = disc.disciplinesPeriod.where((element) => element.moment == period).toList();
                disciplines.add(disc);
              }
            }
            break;
          }
        }
      }
      return disciplines;
    }
    catch (_) {
      return <Discipline>[];
    }
  }
}