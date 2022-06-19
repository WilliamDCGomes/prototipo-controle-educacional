import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../../../../../enums/enums.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_widget.dart';

class CardPaymentController extends GetxController {
  late int creditDebtCardActiveStep;
  late RxBool loadingAnimetion;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  CardPaymentController(){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0;
    loadingAnimetion = false.obs;
    carouselCreditDebtCardController = CarouselController();

    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget(
      loadingAnimetion: loadingAnimetion,
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
    loadingAnimetion.value = true;
    loadingWithSuccessOrErrorWidget.startAnimation();
  }
}