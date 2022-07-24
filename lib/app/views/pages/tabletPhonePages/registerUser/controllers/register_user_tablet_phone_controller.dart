import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../helpers/brazil_address_informations.dart';
import '../../../../../helpers/valid_cellphone_mask.dart';
import '../widgets/body_register_stepper_tablet_phone_widget.dart';
import '../widgets/header_register_stepper_tablet_phone_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../pages/registration_completed_tablet_phone_page.dart';
import '../../../../stylePages/masks_for_text_fields.dart';

class RegisterUserTabletPhoneController extends GetxController {
  late String lgpdPhrase;
  late List<String> periodList;
  late RxInt activeStep;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimetion;
  late RxBool confirmPasswordFieldEnabled;
  late RxBool nameInputHasError;
  late RxBool birthdayInputHasError;
  late RxBool cpfInputHasError;
  late RxBool cepInputHasError;
  late RxBool cityInputHasError;
  late RxBool streetInputHasError;
  late RxBool neighborhoodInputHasError;
  late RxBool schoolNameInputHasError;
  late RxBool courseInputHasError;
  late RxBool emailInputHasError;
  late RxBool confirmEmailInputHasError;
  late RxBool passwordInputHasError;
  late RxBool confirmPasswordInputHasError;
  late RxString ufSelected;
  late RxString periodSelected;
  late RxList<String> ufsList;
  late final GlobalKey<FormState> formKeyPersonalInformation;
  late final GlobalKey<FormState> formKeyAddressInformation;
  late final GlobalKey<FormState> formKeySchoolInformation;
  late final GlobalKey<FormState> formKeyContactInformation;
  late final GlobalKey<FormState> formKeyPasswordInformation;
  late MaskTextInputFormatter maskCellPhoneFormatter;
  late TextEditingController nameTextController;
  late TextEditingController birthDateTextController;
  late TextEditingController cpfTextController;
  late TextEditingController cepTextController;
  late TextEditingController cityTextController;
  late TextEditingController streetTextController;
  late TextEditingController houseNumberTextController;
  late TextEditingController neighborhoodTextController;
  late TextEditingController complementTextController;
  late TextEditingController institutionTextController;
  late TextEditingController courseTextController;
  late TextEditingController phoneTextController;
  late TextEditingController cellPhoneTextController;
  late TextEditingController emailTextController;
  late TextEditingController confirmEmailTextController;
  late TextEditingController pinPutSMSController;
  late TextEditingController pinPutEmailController;
  late TextEditingController emailVerification1TextController;
  late TextEditingController emailVerification2TextController;
  late TextEditingController emailVerification3TextController;
  late TextEditingController emailVerification4TextController;
  late TextEditingController emailVerification5TextController;
  late TextEditingController passwordTextController;
  late TextEditingController confirmPasswordTextController;
  late List<HeaderRegisterStepperTabletPhoneWidget> headerRegisterStepperList;
  late List<BodyRegisterStepperTabletPhoneWidget> bodyRegisterStepperList;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  RegisterUserTabletPhoneController(){
    _initializeVariables();
    _getUfsNames();
  }

  _initializeVariables(){
    lgpdPhrase = "Ao avançar, você esta de acordo e concorda com as Políticas de Privacidade e com os Termos de Serviço.";
    activeStep = 0.obs;
    ufSelected = "".obs;
    periodSelected = "".obs;
    loadingAnimetion = false.obs;
    passwordFieldEnabled = true.obs;
    confirmPasswordFieldEnabled = true.obs;
    nameInputHasError = false.obs;
    birthdayInputHasError = false.obs;
    cpfInputHasError = false.obs;
    cepInputHasError = false.obs;
    cityInputHasError = false.obs;
    streetInputHasError = false.obs;
    neighborhoodInputHasError = false.obs;
    schoolNameInputHasError = false.obs;
    courseInputHasError = false.obs;
    emailInputHasError = false.obs;
    confirmEmailInputHasError = false.obs;
    passwordInputHasError = false.obs;
    confirmPasswordInputHasError = false.obs;
    ufsList = [""].obs;
    periodList = [
      "Matutino",
      "Vespertino",
      "Noturno",
      "Integral",
    ];
    maskCellPhoneFormatter = MasksForTextFields.phoneNumberAcceptExtraNumberMask;
    formKeyPersonalInformation = GlobalKey<FormState>();
    formKeyAddressInformation = GlobalKey<FormState>();
    formKeySchoolInformation = GlobalKey<FormState>();
    formKeyContactInformation = GlobalKey<FormState>();
    formKeyPasswordInformation = GlobalKey<FormState>();
    nameTextController = TextEditingController();
    birthDateTextController = TextEditingController();
    cpfTextController = TextEditingController();
    cepTextController = TextEditingController();
    cityTextController = TextEditingController();
    streetTextController = TextEditingController();
    houseNumberTextController = TextEditingController();
    neighborhoodTextController = TextEditingController();
    complementTextController = TextEditingController();
    institutionTextController = TextEditingController();
    courseTextController = TextEditingController();
    phoneTextController = TextEditingController();
    cellPhoneTextController = TextEditingController();
    emailTextController = TextEditingController();
    confirmEmailTextController = TextEditingController();
    pinPutSMSController = TextEditingController();
    pinPutEmailController = TextEditingController();
    emailVerification1TextController = TextEditingController();
    emailVerification2TextController = TextEditingController();
    emailVerification3TextController = TextEditingController();
    emailVerification4TextController = TextEditingController();
    emailVerification5TextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimetion: loadingAnimetion,
    );
    headerRegisterStepperList = [
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 1 DE 7",
        secondText: "Dados Pessoais",
        thirdText: "Informe os dados pessoais para continuar o cadastro.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 2 DE 7",
        secondText: "Endereço",
        thirdText: "Informe os dados do seu endereço para continuar o cadastro.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 3 DE 7",
        secondText: "Dados Institucionais",
        thirdText: "Preencha os dados institucionais para identificarmos você em nosso sistema.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 4 DE 7",
        secondText: "Dados de Contato",
        thirdText: "Preencha os dados de contato para que seja possível a comunicação.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 5 DE 7",
        secondText: "Confirmação Telefone",
        thirdText: "Informe o código de verificação enviado por SMS para o número informado.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 6 DE 7",
        secondText: "Confirmação E-mail",
        thirdText: "Informe o código de verificação enviado por E-mail para o endereço informado.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 7 DE 7",
        secondText: "Senha de Acesso",
        thirdText: "Crie uma senha para realizar o acesso na plataforma.",
      ),
    ];
    bodyRegisterStepperList = [
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 0,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 1,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 2,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 3,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 4,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 5,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 6,
        controller: this,
      ),
    ];
  }

  _getUfsNames() async {
    ufsList.clear();
    List<String> states = await BrazilAddressInformations.getUfsNames();
    for(var uf in states) {
      ufsList.add(uf);
    }
  }

  nextButtonPressed(){
    switch(activeStep.value){
      case 0:
        if(formKeyPersonalInformation.currentState!.validate()){
          _nextPage();
        }
        break;
      case 1:
        if(formKeyAddressInformation.currentState!.validate()){
          _nextPage();
        }
        break;
      case 2:
        if(formKeySchoolInformation.currentState!.validate()){
          _nextPage();
        }
        break;
      case 3:
        if(formKeyContactInformation.currentState!.validate()){
          _nextPage();
        }
        break;
      case 4:
        _nextPage();
        break;
      case 5:
        _nextPage();
        break;
      case 6:
        if(formKeyPasswordInformation.currentState!.validate()){
          _nextPage();
        }
        break;
    }
  }

  _nextPage(){
    if(activeStep.value < 6)
      activeStep.value ++;
    else{
      loadingAnimetion.value = true;
      loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation(
        destinationPage: RegistrationCompletedTabletPhone(),
      );
    }
  }

  backButtonPressed() async {
    int currentIndex = activeStep.value;
    if (activeStep.value > 0) {
      activeStep.value--;
    }

    return await Future.delayed(
        const Duration(
            milliseconds: 100
        ),
        () {
          return currentIndex <= 0;
        }
    );
  }

  backArrowButtonPressed() {
    if (activeStep.value > 0) {
      activeStep.value--;
    }
    else
      Get.back();
  }

  phoneTextFieldEdited(String cellPhoneTyped){
    cellPhoneTextController.value = ValidCellPhoneMask.updateCellPhoneMask(
      cellPhoneTyped,
      maskCellPhoneFormatter,
    );
  }
}