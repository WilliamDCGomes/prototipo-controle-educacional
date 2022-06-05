import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/page/main_menu_tablet_phone_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../shared/widgets/credit_debt_card_widget.dart';
import '../widget/select_card_payment_widget.dart';

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
  late List<CreditDebtCardWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;
  late AnimationController animationController;

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
        creditDebtCardTypeEnum: creditDebtCardType.mastercard,
        height: 25.h,
        width: 45.h,
        paddingHeightName: 3.h,
      ),
      CreditDebtCardWidget(
        numericEnd: "5967",
        personCardName: "WILLIAM DOUGLAS COSTA GOMES",
        cardExpirationDate: "10/27",
        creditDebtCardTypeEnum: creditDebtCardType.visa,
        height: 25.h,
        width: 45.h,
        paddingHeightName: 3.h,
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
        Get.to(() => SelectCardPaymentWidget());
        break;
      case paymentMethod.bankSlip:
        break;
    }
  }
  
  payRequest() async {
    animationSuccess.value = true;
    animationController.forward();
    await Future.delayed(Duration(seconds: 2));
    Get.offAll(() => MainMenuTabletPhonePage());
  }
}