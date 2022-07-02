import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/viewController/payment_finished_view_controller.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../../helpers/format_numbers.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_widget.dart';
import '../pages/payment_finished_page.dart';
import '../pages/pending_payment_page.dart';
import '../../selectCardPayment/page/select_card_payment_tablet_phone_page.dart';

class StudentRequestController extends GetxController {
  late int creditDebtCardActiveStep;
  late RxBool loadingAnimetion;
  late RxString requestTitle;
  late RxString requestSelected;
  late RxString deliveryDate;
  late RxDouble requestValue;
  late RxList<String> requestTypeList;
  late TextEditingController studentName;
  late TextEditingController raNumber;
  late TextEditingController dateRequest;
  late TextEditingController observations;
  late studentTypeRequest studentRequest;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  StudentRequestController(this.studentRequest){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0;
    loadingAnimetion = false.obs;

    switch(studentRequest){
      case studentTypeRequest.studentCard:
        requestSelected = requestTypeList[0].obs;
        requestTitle = requestTypeList[0].obs;
        requestValue = 35.0.obs;
        deliveryDate = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 5))).obs;
        break;
      case studentTypeRequest.schoolStatement:
        requestSelected = requestTypeList[1].obs;
        requestTitle = requestTypeList[1].obs;
        requestValue = 20.0.obs;
        deliveryDate = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 3))).obs;
        break;
      default:
        requestValue = 0.0.obs;
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

    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget(
      loadingAnimetion: loadingAnimetion,
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
      switch(requestTitle.value){
        case "Carteirinha de Estudante":
          requestValue.value = 35.0;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 5)));
          break;
        case "Declaração Escolar":
          requestValue.value = 20.0;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 3)));
          break;
        default:
          requestValue.value = 0.0;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now());
          break;
      }
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
          requestValue.value,
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
          FormatNumbers.numbersToString(requestValue.value),
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
      FormatNumbers.numbersToString(requestValue.value),
      dateRequest.text,
    );
    loadingAnimetion.value = true;
    loadingWithSuccessOrErrorWidget.startAnimation(
      destinationPage: PaymentFinished(
        paymentFinishedViewController: payment,
      ),
    );
  }
}