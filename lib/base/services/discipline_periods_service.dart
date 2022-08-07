import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/discipline_periods.dart';
import 'interfaces/idiscipline_periods_service.dart';

class DisciplinePeriodsService implements IDisciplinePeriodsService {
  Future<List<DisciplinePeriods>> getDisciplinePeriods(String institutionId) async {
    try {
      var disciplinePeriods = await FirebaseFirestore.instance.collection("discipline_periods")
          .doc(institutionId).get();
      if(disciplinePeriods.exists && disciplinePeriods.data() != null) {
        List<DisciplinePeriods> disciplinePeriodsList = <DisciplinePeriods>[];
        disciplinePeriods.data()!.forEach((k, v) => disciplinePeriodsList.add(DisciplinePeriods.fromJsonFirebase(v)));

        return disciplinePeriodsList;
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}