import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/cardMainMenuWidget.dart';

class MainMenuTabletPhoneController extends GetxController {
  late int activeStep;
  late String nameInitials;
  late RxBool hasPicture;
  late RxString courseName;
  late RxString welcomePhrase;
  late List<CardMainMenuWidget> cardMainMenuList;
  late CarouselController carouselController;

  MainMenuTabletPhoneController(){
    activeStep = 0;
    carouselController = CarouselController();
    _getValues();
    _loadCardsMainMenu();
    _getWelcomePhrase();
  }

  _getValues(){
    nameInitials = "WG";
    hasPicture = false.obs;
    courseName = "Ciência da Computação".obs;
  }

  _loadCardsMainMenu(){
    cardMainMenuList = [
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
      ),
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
      ),
      CardMainMenuWidget(
        imagePath: "Icone_Notificacao.svg",
        firstText: "Meu Painel",
        secondText: "Ciência da Computação",
        thirdText: "4º Ano",
      ),
    ];
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