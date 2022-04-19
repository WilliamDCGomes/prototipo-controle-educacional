import 'package:get/get.dart';

class MainMenuTabletPhoneController extends GetxController {
  late String nameInitials;
  late RxBool hasPicture;
  late RxString courseName;

  MainMenuTabletPhoneController(){
    _getValues();
  }

  _getValues(){
    nameInitials = "WG";
    hasPicture = false.obs;
    courseName = "Ciência da Computação".obs;
  }
}