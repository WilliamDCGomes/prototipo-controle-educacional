import 'package:cloud_firestore/cloud_firestore.dart';
import 'interfaces/iitens_orders_by_user_service.dart';

class ItensOrderByUserService implements IItensOrderByUserService {
  Future<Map<String, dynamic>?> getOrderLists(String cpfStudent) async {
    try {
      var lastRaRegistered = await FirebaseFirestore.instance.collection("itens_orders_by_user")
          .doc(cpfStudent).get();
      if(lastRaRegistered.exists) {
        return lastRaRegistered.data();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<bool> insertOrderLists(String cpfStudent, String key, List<Map<String, dynamic>> newList) async {
    try {
      await FirebaseFirestore.instance.collection("itens_orders_by_user")
        .doc(cpfStudent)
        .update(
          {
            key: newList,
          }
        );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> updateOrderLists(String cpfStudent, String key, List<Map<String, dynamic>> newList) async {
    try {
      await FirebaseFirestore.instance.collection("itens_orders_by_user")
        .doc(cpfStudent)
        .update(
          {
            key: newList,
          }
        );
      return true;
    } catch (_) {
      return false;
    }
  }
}