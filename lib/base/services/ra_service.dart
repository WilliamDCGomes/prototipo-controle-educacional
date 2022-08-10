import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../models/ra_information.dart';
import 'interfaces/ira_service.dart';

class RaService implements IRaService {
  Future<int> createNewRA(String studentId, String educationInstitutionId) async {
    try {
      while(true){
        var lastRaRegistered = await FirebaseFirestore.instance.collection("ra").get();
        int raValue = 0;
        if(lastRaRegistered.size > 0) {
          for(var item in lastRaRegistered.docs){
            if(item["ra"] > raValue){
              raValue = item["ra"];
            }
          }
          raValue++;
        }
        else{
          raValue = 1000;
        }
        if(raValue >= 1000){
          RaInformation raInformation = RaInformation();
          raInformation.ra = raValue;
          raInformation.studentId = studentId;
          raInformation.educationInstitutionId = educationInstitutionId;

          String docId = Uuid().v4();
          await FirebaseFirestore.instance.collection("ra")
              .doc(docId)
              .set(raInformation.toJson());

          if(await checkIfExistDuplicateRa(raValue)){
            await deleteDuplicateRa(docId);
            continue;
          }
          else{
            return raValue;
          }
        }
        break;
      }
      return 0;
    }
    catch (_) {
      return 0;
    }
  }

  Future<bool> checkIfExistDuplicateRa(int ra) async {
    try {
      var lastRaRegistered = await FirebaseFirestore.instance.collection("ra")
          .where("ra", isEqualTo: ra).get();
      if(lastRaRegistered.size > 1) {
        return true;
      }
      else{
        return false;
      }
    }
    catch (_) {
      return true;
    }
  }

  Future<bool> deleteDuplicateRa(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("ra")
          .doc(docId)
          .delete();
      return true;
    }
    catch (_) {
      return false;
    }
  }
}