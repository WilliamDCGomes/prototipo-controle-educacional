import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/registration_cancellation.dart';
import 'interfaces/irequest_registration_cancellation_service.dart';

class RequestRegistrationCancellationService implements IRequestRegistrationCancellationService {
  Future<bool> requestRegistrationCancellation(RegistrationCancellation cancellation) async {
    try {
      await FirebaseFirestore.instance
          .collection("request_registration_cancellation")
          .doc(cancellation.cpf)
          .set(cancellation.toJson())
          .timeout(Duration(minutes: 2));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<RegistrationCancellation?> getRegistrationCancellation(String cpf) async {
    try {
      var requestCancellation = await FirebaseFirestore.instance
          .collection("request_registration_cancellation")
          .where("cpf", isEqualTo: cpf)
          .where("active", isEqualTo: true)
          .get()
          .timeout(Duration(minutes: 2));

      if(requestCancellation.size > 0) {
        return RegistrationCancellation.fromJsonFirebase(requestCancellation.docs.first.data());
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<bool> checkRegistrationCancellationAlrightExist(String cpf) async {
    try {
      var verification = await FirebaseFirestore.instance
          .collection("request_registration_cancellation")
          .where("cpf", isEqualTo: cpf)
          .where("active", isEqualTo: true)
          .get()
          .timeout(Duration(minutes: 2));

      return verification.size > 0;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteRegistrationCancellation(RegistrationCancellation cancellation) async {
    try {
      await FirebaseFirestore.instance
          .collection("request_registration_cancellation")
          .doc(cancellation.cpf)
          .update(cancellation.toJson())
          .timeout(Duration(minutes: 2));

      return true;
    } catch (_) {
      return false;
    }
  }
}