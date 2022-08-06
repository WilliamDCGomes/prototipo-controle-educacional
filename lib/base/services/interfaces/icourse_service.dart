import '../../models/course.dart';

abstract class ICourseService {
  Future<List<Course>> getCourses();

  Future<List<String>> getCoursesName();

  Future<String> getCourseNameById(String id);
}