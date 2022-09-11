import 'package:carousel_slider/carousel_controller.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/base/models/student_request.dart';
import 'package:projeto_tcc/base/viewController/payment_finished_view_controller.dart';
import '../../../../../../base/services/interfaces/istudent_request_service.dart';
import '../../../../../../base/services/student_request_service.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/format_numbers.dart';
import '../../../../../utils/logged_user.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
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
  late StudentRequest? studentRequest;
  late IStudentRequestService _studentRequestService;

  SelectCardPaymentTabletPhoneController(this.selectCardPaymentViewController, {this.studentRequest}){
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

    _studentRequestService = StudentRequestService();
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
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      var payment = PaymentFinishedViewController(
        selectCardPaymentViewController.studentName,
        selectCardPaymentViewController.raNumber,
        selectCardPaymentViewController.requestTitle,
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-04",
        FormatNumbers.numbersToString(selectCardPaymentViewController.paymentValue),
        selectCardPaymentViewController.getDateRequest,
      );

      if(studentRequest != null){
        studentRequest!.paid = true;
        studentRequest!.paymentDate = DateTime.now();
        //TODO Colocar o id do cartão utilizado no pagamento
        studentRequest!.paymentCardId = "";

        if(await _studentRequestService.sendNewRequest(studentRequest!)){
          await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(
            destinationPage: PaymentFinishedTabletPhonePage(
              paymentFinishedViewController: payment,
            ),
          );
          return;
        }
      }
      throw Exception();
    }
    catch(_){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Ocorreu um erro durante a solicitação.\nTente novamente mais tarde!",
          );
        },
      );
    }
  }
}