import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/base/services/interfaces/iuser_service.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
import '../models/professor.dart';
import 'interfaces/iprofessor_service.dart';

class ProfessorService implements IProfessorService {
  late IUserService _userService;

  Future<String> getProfessorName(String professorId) async {
    try {
      String professorName = "";
      _userService = UserService();
      var professor = await FirebaseFirestore.instance
          .collection("professor")
          .where("id", isEqualTo: professorId)
          .get()
          .timeout(Duration(minutes: 2));

      if(professor.size > 0) {
        Professor _professor = Professor.fromJsonFirebase(professor.docs.first.data());
        if(_professor != null){
          professorName += _professor.professorTitle += " ";
          professorName += await _userService.getName(_professor.cpf);
        }
      }
      return professorName;
    } catch (_) {
      return "";
    }
  }
}