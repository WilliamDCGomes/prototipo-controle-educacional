import 'package:carousel_slider/carousel_controller.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:get/get.dart';
import '../../../../../enums/enums.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';

class CardPaymentController extends GetxController {
  late RxInt creditDebtCardActiveStep;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  CardPaymentController(){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0.obs;
    carouselCreditDebtCardController = CarouselController();
  }

  _inicializeList(){
    creditDebtCardList = [

      CreditDebtCardWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.mastercard,
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.elo,
        creditDebtCardTypeEnum: creditDebtCardType.credit,
      ),
    ];
  }
}