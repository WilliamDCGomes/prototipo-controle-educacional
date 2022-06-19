import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../../../../enums/enums.dart';
import '../../shared/widgets/animation_success_widget.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';

class CardPaymentController extends GetxController {
  late int creditDebtCardActiveStep;
  late RxBool animationSuccess;
  late AnimationSuccessWidget animationSuccessWidget;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  CardPaymentController(){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0;
    animationSuccess = false.obs;
    carouselCreditDebtCardController = CarouselController();

    animationSuccessWidget = AnimationSuccessWidget(
      animationSuccess: animationSuccess,
    );
  }

  _inicializeList(){
    creditDebtCardList = [

      CreditDebtCardWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        flagCard: flagCards.mastercardFlag,
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        flagCard: flagCards.eloFlag,
        creditDebtCardTypeEnum: creditDebtCardType.credit,
      ),
    ];
  }

  addCard() async {
    animationSuccess.value = true;
    animationSuccessWidget.iniciaAnimacao(
      destinationPage: MainMenuTabletPhonePage(),
    );
  }
}