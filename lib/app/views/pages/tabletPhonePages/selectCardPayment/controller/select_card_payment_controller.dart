import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/viewController/payment_finished_view_controller.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../shared/widgets/animation_success_widget.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../../studentRequest/pages/payment_finished_page.dart';

class SelectCardPaymentController extends GetxController {
  late int creditDebtCardActiveStep;
  late RxBool animationSuccess;
  late SelectCardPaymentViewController selectCardPaymentViewController;
  late AnimationSuccessWidget animationSuccessWidget;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  SelectCardPaymentController(this.selectCardPaymentViewController){
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
        creditDebtCardTypeEnum: creditDebtCardType.mastercard,
      ),
      CreditDebtCardWidget(
        numericEnd: "5967",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "10/27",
        creditDebtCardTypeEnum: creditDebtCardType.visa,
      ),
    ];
  }

  payRequest() async {
    var payment = PaymentFinishedViewController(
      selectCardPaymentViewController.studentName,
      selectCardPaymentViewController.requestTitle,
      "BANCO ITAÚ UNIBANCO S/A",
      "60.701.190/0001-04",
      selectCardPaymentViewController.getDateRequest,
    );
    animationSuccess.value = true;
    animationSuccessWidget.iniciaAnimacao(
      destinationPage: PaymentFinished(
        paymentFinishedViewController: payment,
      ),
    );
  }
}