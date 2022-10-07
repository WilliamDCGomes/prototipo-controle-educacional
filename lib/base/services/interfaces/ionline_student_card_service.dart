import '../../models/online_student_card.dart';

abstract class IOnlineStudentCardService {
  Future<OnlineStudentCard?> getOnlineStudentCard();

  Future<bool> checkOnlineStudentCardExist();
}