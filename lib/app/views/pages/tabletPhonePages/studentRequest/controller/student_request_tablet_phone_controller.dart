import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/paths.dart';
import 'package:projeto_tcc/base/viewController/payment_finished_view_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/date_format_to_brazil.dart';
import '../../../../../utils/format_numbers.dart';
import '../../../../../utils/logged_user.dart';
import '../../shared/popups/bottom_sheet_tablet_phone_popup.dart';
import '../../shared/widgets/credit_debt_card_tablet_phone_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../popup/payment_form_tablet_phone_popup.dart';

class StudentRequestTabletPhoneController extends GetxController {
  late int creditDebtCardActiveStep;
  late RxBool showDisciplines;
  late RxBool loadingAnimation;
  late RxString requestTitle;
  late RxString imageIllustration;
  late RxString requestSelected;
  late RxString disciplineSelected;
  late RxString deliveryDate;
  late RxDouble requestValue;
  late RxList<String> requestTypeList;
  late RxList<String> disciplinesList;
  late TextEditingController studentName;
  late TextEditingController raNumber;
  late TextEditingController dateRequest;
  late TextEditingController observations;
  late studentTypeRequest studentRequest;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late List<CreditDebtCardTabletPhoneWidget> creditDebtCardList;
  late CarouselController carouselCreditDebtCardController;

  StudentRequestTabletPhoneController(this.studentRequest){
    _inicializeList();
    _inicializeVariables();
  }

  _inicializeVariables(){
    creditDebtCardActiveStep = 0;
    showDisciplines = false.obs;
    loadingAnimation = false.obs;
    disciplineSelected = "".obs;

    switch(studentRequest){
      case studentTypeRequest.studentCard:
        requestSelected = requestTypeList[0].obs;
        requestTitle = requestTypeList[0].obs;
        imageIllustration = Paths.Icone_Exibicao_Carterinho_Online.obs;
        requestValue = 30.0.obs;
        deliveryDate = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 5))).obs;
        showDisciplines.value = false;
        break;
      case studentTypeRequest.schoolStatement:
        requestSelected = requestTypeList[1].obs;
        requestTitle = requestTypeList[1].obs;
        imageIllustration = Paths.Icone_Exibicao_Declaracao_Escolar.obs;
        requestValue = 20.0.obs;
        deliveryDate = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 3))).obs;
        showDisciplines.value = false;
        break;
      case studentTypeRequest.substituteExam:
        requestSelected = requestTypeList[2].obs;
        requestTitle = requestTypeList[2].obs;
        imageIllustration = Paths.Solicitacao_Segunda_Chamada.obs;
        requestValue = 35.0.obs;
        deliveryDate = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 0))).obs;
        showDisciplines.value = true;
        break;
      default:
        requestValue = 0.0.obs;
        showDisciplines.value = false;
        break;
    }
    studentName = TextEditingController();
    raNumber = TextEditingController();
    dateRequest = TextEditingController();
    observations = TextEditingController();

    studentName.text = LoggedUser.name;
    raNumber.text = LoggedUser.ra.toString();
    dateRequest.text = DateFormatToBrazil.formatDate(DateTime.now());
    carouselCreditDebtCardController = CarouselController();

    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  _inicializeList(){
    requestTypeList = [
      "Carteirinha de Estudante",
      "Declaração Escolar",
      "Prova Substitutiva",
    ].obs;

    disciplinesList = [
      "Ciência de Dados II",
      "Computação Gráfica e Visão Computacional",
      "Legislação e Ética",
      "Projetos de Redes de Computadores",
      "Projeto II",
      "Pesquisa Operacional",
      "Tópicos Avançados em Sistemas Computacionais",
      "Liderança, Empreendedorismo e Inovação",
    ].obs;

    creditDebtCardList = [
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "0365",
        personCardName: LoggedUser.name.toUpperCase(),
        cardExpirationDate: "02/29",
        creditDebtCardTypeEnum: creditDebtCardType.debit,
      ),
      CreditDebtCardTabletPhoneWidget(
        numericEnd: "5967",
        personCardName: LoggedUser.name.toUpperCase(),
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
          requestValue.value = 30.0;
          imageIllustration.value = Paths.Icone_Exibicao_Carterinho_Online;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 5)));
          showDisciplines.value = false;
          break;
        case "Declaração Escolar":
          requestValue.value = 20.0;
          imageIllustration.value = Paths.Icone_Exibicao_Declaracao_Escolar;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 3)));
          showDisciplines.value = false;
          break;
        case "Prova Substitutiva":
          requestValue.value = 35.0;
          imageIllustration.value = Paths.Solicitacao_Segunda_Chamada;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now().add(Duration(days: 0)));
          showDisciplines.value = true;
          break;
        default:
          requestValue.value = 0.0;
          deliveryDate.value = DateFormatToBrazil.formatDate(DateTime.now());
          showDisciplines.value = false;
          break;
      }
    }
  }

  onDropdownButtonDisciplineChanged(String? selectedState){
    disciplineSelected.value = selectedState ?? "";
  }

  payRequest() async {
    var payment = PaymentFinishedViewController(
      studentName.text,
      raNumber.text,
      requestTitle.value,
      "BANCO ITAÚ UNIBANCO S/A",
      "60.701.190/0001-04",
      FormatNumbers.numbersToString(requestValue.value),
      dateRequest.text,
    );

    BottomSheetTabletPhonePopup.showAlert(
      Get.context!,
      PaymentFormTabletPhonePopup(payment).getWidgetList(
        Get.context!,
      ),
    );
  }
}