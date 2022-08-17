import 'package:carousel_slider/carousel_controller.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/viewController/payment_finished_view_controller.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/format_numbers.dart';
import '../../../../../utils/logged_user.dart';
import '../../shared/widgets/credit_debt_card_tablet_phone_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../../studentRequest/pages/payment_finished_tablet_phone_page.dart';

class SelectCardPaymentTabletPhoneController extends GetxController {
  late RxInt creditDebtCardActiveStep;
  late RxBool loadingAnimation;
  late SelectCardPaymentViewController selectCardPaymentViewController;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late List<CreditDebtCardTabletPhoneWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  SelectCardPaymentTabletPhoneController(this.selectCardPaymentViewController){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0.obs;
    loadingAnimation = false.obs;
    carouselCreditDebtCardController = CarouselController();

    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
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

  payRequest() async {
    var payment = PaymentFinishedViewController(
      selectCardPaymentViewController.studentName,
      selectCardPaymentViewController.raNumber,
      selectCardPaymentViewController.requestTitle,
      "BANCO ITAÚ UNIBANCO S/A",
      "60.701.190/0001-04",
      FormatNumbers.numbersToString(selectCardPaymentViewController.paymentValue),
      selectCardPaymentViewController.getDateRequest,
    );
    loadingAnimation.value = true;
    loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation(
      destinationPage: PaymentFinishedTabletPhonePage(
        paymentFinishedViewController: payment,
      ),
    );
  }
}