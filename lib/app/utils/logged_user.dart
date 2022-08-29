import 'package:age_calculator/age_calculator.dart';

class LoggedUser {
  static String id = "";
  static String name = "";
  static String nameInitials = "";
  static String nameAndLastName = "";
  static String birthdate = "";
  static String cpf = "";
  static String gender = "";
  static String cep = "";
  static String uf = "";
  static String city = "";
  static String street = "";
  static String? houseNumber = "";
  static String neighborhood = "";
  static String complement = "";
  static int ra = 0;
  static int bimester = 0;
  static int semester = 0;
  static int studentYear = 0;
  static double monthly_payment = 0.0;
  static String educationInstitutionId = "";
  static String courseId = "";
  static String educationInstitutionName = "";
  static String courseName = "";
  static String period = "";
  static String? phone = "";
  static String? cellPhone = "";
  static String email = "";
  static String password = "";
  static DateTime? lastChange;

  static String get userAge {
    try{
      var bithdayUsaVersion = birthdate.split('/');
      DateTime userBirthday = DateTime.parse("${bithdayUsaVersion[2]}-${bithdayUsaVersion[1]}-${bithdayUsaVersion[0]}");
      DateDuration age = AgeCalculator.age(userBirthday);
      return ", ${age.years}";
    }
    catch(_){
      return "";
    }
  }
}