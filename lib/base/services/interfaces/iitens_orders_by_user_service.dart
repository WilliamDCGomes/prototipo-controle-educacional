abstract class IItensOrderByUserService {
  Future<Map<String, dynamic>?> getOrderLists(String cpfStudent);

  Future<bool> insertOrderLists(String cpfStudent, String key, List<Map<String, dynamic>> newList);

  Future<bool> updateOrderLists(String cpfStudent, String key, List<Map<String, dynamic>> newList);
}