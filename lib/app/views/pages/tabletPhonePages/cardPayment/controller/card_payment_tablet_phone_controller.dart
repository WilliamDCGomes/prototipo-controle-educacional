import 'package:carousel_slider/carousel_controller.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import '../../../../../enums/enums.dart';
import '../../shared/widgets/credit_debt_card_tablet_phone_widget.dart';

class CardPaymentTabletPhoneController extends GetxController {
  late RxInt creditDebtCardActiveStep;
  late List<CreditDebtCardTabletPhoneWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  CardPaymentTabletPhoneController(){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0.obs;
    carouselCreditDebtCardController = CarouselController();
  }

  _inicializeList(){
    creditDebtCardList = [
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: LoggedUser.name.toUpperCase(),
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.mastercard,
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: LoggedUser.name.toUpperCase(),
        cardExpirationDate: "02/29",
        flagCard: CreditCardType.elo,
        creditDebtCardTypeEnum: creditDebtCardType.credit,
      ),
    ];
  }
}