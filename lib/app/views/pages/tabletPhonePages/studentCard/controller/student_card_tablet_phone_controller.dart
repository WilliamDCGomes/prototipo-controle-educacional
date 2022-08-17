import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import '../../../../../utils/paths.dart';

class StudentCardTabletPhoneController extends GetxController {
  late String imageBasePath;
  late String cardNumber;
  late String raNumber;
  late String studentName;
  late String validateCard;

  StudentCardTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    imageBasePath = Paths.Carteirinha_PCE;
    cardNumber = "0026 2659 0211 0365";
    raNumber = LoggedUser.ra.toString();
    studentName = LoggedUser.nameAndLastName.toUpperCase();
    validateCard = "12/2022";
  }
}