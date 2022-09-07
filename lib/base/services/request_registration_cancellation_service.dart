import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/registration_cancellation.dart';
import 'interfaces/irequest_registration_cancellation_service.dart';

class RequestRegistrationCancellationService implements IRequestRegistrationCancellationService {
  Future<bool> requestRegistrationCancellation(RegistrationCancellation cancellation) async {
    try {
      await FirebaseFirestore.instance.collection("request_registration_cancellation")
          .doc(cancellation.cpf)
          .set(cancellation.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<RegistrationCancellation?> getRegistrationCancellation(String cpf) async {
    try {
      var requestCancellation = await FirebaseFirestore.instance.collection("request_registration_cancellation")
          .where("cpf", isEqualTo: cpf).get();
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
      var verification = await FirebaseFirestore.instance.collection("request_registration_cancellation")
          .doc(cpf).get();
      return verification.exists;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteRegistrationCancellation(String cpf) async {
    try {
      await FirebaseFirestore.instance.collection("request_registration_cancellation")
          .doc(cpf)
          .delete();
      return true;
    } catch (_) {
      return false;
    }
  }
}