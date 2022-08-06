import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/course.dart';
import 'interfaces/icourse_service.dart';

class CourseService implements ICourseService {
  Future<List<Course>> getCourses() async {
    try {
      var courses = await FirebaseFirestore.instance.collection("courses").get();
      if(courses.size > 0){
        List<Course> coursesName = <Course>[];
        for(var course in courses.docs){
          coursesName.add(Course.fromJson(course.data()));
        }

        return coursesName;
      }
      return [];
    } catch (_) {
      return [];
    }
  }

  Future<List<String>> getCoursesName() async {
    try {
      var courses = await FirebaseFirestore.instance.collection("courses").get();
      if(courses.size > 0){
        List<String> coursesName = <String>[];
        for(var course in courses.docs){
          coursesName.add(course.data()["name"]);
        }

        return coursesName;
      }
      return [];
    } catch (_) {
      return [];
    }
  }

  Future<Course?> getCoursesById(String id) async {
    try {
      var course = await FirebaseFirestore.instance.collection("courses")
          .doc(id).get();
      if(course.exists && course.data() != null){
        return Course.fromJson(course.data()!);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<String> getCourseNameById(String id) async {
    try {
      var course = await FirebaseFirestore.instance.collection("courses")
          .doc(id).get();
      if(course.exists && course.data() != null) {
        return Course.fromJson(course.data()!).name;
      }
      return "";
    } catch (_) {
      return "";
    }
  }
}