import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/education_institution.dart';
import 'interfaces/ieducation_institution_service.dart';

class EducationInstitutionService implements IEducationInstitutionService {
  Future<List<EducationInstitution>> getEducationInstitutions() async {
    try {
      var educationInstitutions = await FirebaseFirestore.instance.collection("educational_institution").get();

      if(educationInstitutions.size > 0){
        List<EducationInstitution> institutions = <EducationInstitution>[];
        for(var educationInstitution in educationInstitutions.docs){
          institutions.add(EducationInstitution.fromJson(educationInstitution.data()));
        }
        return institutions;
      }

      return [];
    } catch (_) {
      return [];
    }
  }
}