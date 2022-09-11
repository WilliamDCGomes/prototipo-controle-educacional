import 'package:cloud_firestore/cloud_firestore.dart';
import 'interfaces/idiscipline_service.dart';

class DisciplineService implements IDisciplineService {
  Future<String> getDisciplineId(String name) async {
    try {
      var disciplinesId = await FirebaseFirestore.instance.collection("disciplines")
          .where("name", isEqualTo: name).get().timeout(Duration(minutes: 2));
      if(disciplinesId.size > 1) {
        return disciplinesId.docs.first["id"];
      }
      else{
        return "";
      }
    }
    catch (_) {
      return "";
    }
  }
}