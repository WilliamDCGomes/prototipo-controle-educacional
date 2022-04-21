import 'package:get/get.dart';

class MainMenuTabletPhoneController extends GetxController {
  late String nameInitials;
  late RxBool hasPicture;
  late RxString courseName;
  late RxString welcomePhrase;

  MainMenuTabletPhoneController(){
    _getValues();
    _getWelcomePhrase();
  }

  _getValues(){
    nameInitials = "WG";
    hasPicture = false.obs;
    courseName = "Ciência da Computação".obs;
  }

  _getWelcomePhrase() {
    int currentHour = DateTime.now().hour;
    if(currentHour >= 0 && currentHour < 12)
      welcomePhrase = "Bom dia!".obs;
    else if(currentHour >= 12 && currentHour < 18)
      welcomePhrase = "Boa tarde!".obs;
    else
      welcomePhrase = "Boa noite!".obs;
  }
}