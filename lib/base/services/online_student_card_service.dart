import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import '../models/online_student_card.dart';
import 'interfaces/ionline_student_card_service.dart';

class OnlineStudentCardService implements IOnlineStudentCardService {
  Future<OnlineStudentCard?> getOnlineStudentCard() async {
    try {
      var onlineStudentCard = await FirebaseFirestore.instance.collection("online_student_card")
          .where("userId", isEqualTo: LoggedUser.id)
          .get()
          .timeout(Duration(minutes: 2));

      if(onlineStudentCard.size > 0) {
        return OnlineStudentCard.fromJsonFirebase(onlineStudentCard.docs.first.data());
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<bool> checkOnlineStudentCardExist() async {
    try {
      var verification = await FirebaseFirestore.instance.collection("online_student_card")
          .where("userId", isEqualTo: LoggedUser.id)
          .get()
          .timeout(Duration(minutes: 2));

      if(verification.size > 0) {
        return true;
      }
      return false;
    }
    catch (_) {
      return false;
    }
  }
}