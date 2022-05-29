import 'package:get/get.dart';

import '../../../../../helpers/paths.dart';

class StudentCardController extends GetxController {
  late String imageBasePath;
  late String cardNumber;
  late String raNumber;
  late String studentName;
  late String validateCard;

  StudentCardController(){
    _initializeVariables();
  }

  _initializeVariables(){
    imageBasePath = Paths.Carteirinha_PCE;
    cardNumber = "0026 2659 0211 0365";
    raNumber = "48467";
    studentName = "WILLIAM DOUGLAS";
    validateCard = "12/2022";
  }
}