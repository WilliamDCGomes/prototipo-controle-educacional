import '../../models/student_request.dart';

abstract class IStudentRequestService {
  Future<bool> sendNewRequest(StudentRequest newRequest);
}