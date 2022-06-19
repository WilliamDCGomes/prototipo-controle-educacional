import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/viewController/payment_finished_view_controller.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../shared/widgets/animation_success_widget.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../pages/payment_finished_page.dart';
import '../pages/pending_payment_page.dart';
import '../../selectCardPayment/page/select_card_payment_tablet_phone_page.dart';

class StudentRequestController extends GetxController {
  late int creditDebtCardActiveStep;
  late RxBool animationSuccess;
  late RxString requestTitle;
  late RxString requestSelected;
  late RxList<String> requestTypeList;
  late TextEditingController studentName;
  late TextEditingController raNumber;
  late TextEditingController dateRequest;
  late TextEditingController observations;
  late studentTypeRequest studentRequest;
  late AnimationSuccessWidget animationSuccessWidget;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  StudentRequestController(this.studentRequest){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0;
    animationSuccess = false.obs;

    switch(studentRequest){
      case studentTypeRequest.studentCard:
        requestSelected = requestTypeList[0].obs;
        requestTitle = requestTypeList[0].obs;
        break;
      case studentTypeRequest.schoolStatement:
        requestSelected = requestTypeList[1].obs;
        requestTitle = requestTypeList[1].obs;
        break;
    }
    studentName = TextEditingController();
    raNumber = TextEditingController();
    dateRequest = TextEditingController();
    observations = TextEditingController();

    studentName.text = "William Douglas Costa Gomes";
    raNumber.text = "48467";
    dateRequest.text = DateFormatToBrazil.formatDate(DateTime.now());
    carouselCreditDebtCardController = CarouselController();

    animationSuccessWidget = AnimationSuccessWidget(
      animationSuccess: animationSuccess,
    );
  }

  _inicializeList(){
    requestTypeList = [
      "Carteirinha de Estudante",
      "Declaração Escolar",
    ].obs;

    creditDebtCardList = [
      CreditDebtCardWidget(
        numericEnd: "0365",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "02/29",
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardWidget(
        numericEnd: "5967",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "10/27",
        creditDebtCardTypeEnum: creditDebtCardType.credit,
      ),
    ];
  }

  onDropdownButtonWidgetChanged(String? selectedState){
    requestSelected.value = selectedState ?? "";
    if(selectedState != null){
      requestTitle.value = selectedState;
    }
  }

  selectPaymentForm(paymentMethod payment){
    Get.back();
    switch(payment){
      case paymentMethod.creditCard:
        var paymentCard = SelectCardPaymentViewController(
          studentName.text,
          requestTitle.value,
          raNumber.text,
          20,
          DateTime.now(),
        );
        Get.to(() => SelectCardPaymentTabletPhonePage(
          selectCardPaymentViewController: paymentCard,
        ));
        break;
      case paymentMethod.bankSlip:
        var payment = PaymentFinishedViewController(
          studentName.text,
          requestTitle.value,
          "BANCO ITAÚ UNIBANCO S/A",
          "60.701.190/0001-04",
          dateRequest.text,
        );
        Get.to(() => PendingPaymentPage(
          paymentFinishedViewController: payment,
        ));
        break;
    }
  }

  payRequest() async {
    var payment = PaymentFinishedViewController(
      studentName.text,
      requestTitle.value,
      "BANCO ITAÚ UNIBANCO S/A",
      "60.701.190/0001-04",
      dateRequest.text,
    );
    animationSuccess.value = true;
    animationSuccessWidget.iniciaAnimacao(
      destinationPage: PaymentFinished(
        paymentFinishedViewController: payment,
      ),
    );
  }
}