import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../helpers/brazil_address_informations.dart';
import '../../shared/widgets/animation_success_widget.dart';
import '../../shared/widgets/body_register_stepper_widget.dart';
import '../../shared/widgets/header_register_stepper_widget.dart';
import '../pages/registration_completed_tablet_phone_page.dart';
import '../../../../stylePages/masks_for_text_fields.dart';

class RegisterUserController extends GetxController {
  late String lgpdPhrase;
  late List<String> periodList;
  late RxInt activeStep;
  late RxBool passwordFieldEnabled;
  late RxBool animationSuccess;
  late RxBool confirmPasswordFieldEnabled;
  late RxString ufSelected;
  late RxString periodSelected;
  late RxList<String> ufsList;
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
  late List<HeaderRegisterStepperWidget> headerRegisterStepperList;
  late List<BodyRegisterStepperWidget> bodyRegisterStepperList;
  late AnimationSuccessWidget animationSuccessWidget;

  RegisterUserController(){
    _initializeVariables();
    _getUfsNames();
  }

  _initializeVariables(){
    lgpdPhrase = "Ao avançar, você esta de acordo e concorda com as Políticas de Privacidade e com os Termos de Serviço.";
    activeStep = 0.obs;
    ufSelected = "".obs;
    periodSelected = "".obs;
    animationSuccess = false.obs;
    passwordFieldEnabled = true.obs;
    confirmPasswordFieldEnabled = true.obs;
    ufsList = [""].obs;
    periodList = [
      "Matutino",
      "Vespertino",
      "Noturno",
      "Integral",
    ];
    maskCellPhoneFormatter = MasksForTextFields.phoneNumberAcceptExtraNumberMask;
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
    animationSuccessWidget = AnimationSuccessWidget(
      animationSuccess: animationSuccess,
    );
    headerRegisterStepperList = [
      HeaderRegisterStepperWidget(
        firstText: "PASSO 1 DE 7",
        secondText: "Dados Pessoais",
        thirdText: "Informe os dados pessoais para continuar o cadastro.",
      ),
      HeaderRegisterStepperWidget(
        firstText: "PASSO 2 DE 7",
        secondText: "Endereço",
        thirdText: "Informe os dados do seu endereço para continuar o cadastro.",
      ),
      HeaderRegisterStepperWidget(
        firstText: "PASSO 3 DE 7",
        secondText: "Dados Institucionais",
        thirdText: "Preencha os dados institucionais para identificarmos você em nosso sistema.",
      ),
      HeaderRegisterStepperWidget(
        firstText: "PASSO 4 DE 7",
        secondText: "Dados de Contato",
        thirdText: "Preencha os dados de contato para que seja possível a comunicação.",
      ),
      HeaderRegisterStepperWidget(
        firstText: "PASSO 5 DE 7",
        secondText: "Confirmação Telefone",
        thirdText: "Informe o código de verificação enviado por SMS para o número informado.",
      ),
      HeaderRegisterStepperWidget(
        firstText: "PASSO 6 DE 7",
        secondText: "Confirmação E-mail",
        thirdText: "Informe o código de verificação enviado por E-mail para o endereço informado.",
      ),
      HeaderRegisterStepperWidget(
        firstText: "PASSO 7 DE 7",
        secondText: "Senha de Acesso",
        thirdText: "Crie uma senha para realizar o acesso na plataforma.",
      ),
    ];
    bodyRegisterStepperList = [
      BodyRegisterStepperWidget(
        indexView: 0,
        controller: this,
      ),
      BodyRegisterStepperWidget(
        indexView: 1,
        controller: this,
      ),
      BodyRegisterStepperWidget(
        indexView: 2,
        controller: this,
      ),
      BodyRegisterStepperWidget(
        indexView: 3,
        controller: this,
      ),
      BodyRegisterStepperWidget(
        indexView: 4,
        controller: this,
      ),
      BodyRegisterStepperWidget(
        indexView: 5,
        controller: this,
      ),
      BodyRegisterStepperWidget(
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
    if(activeStep.value < 6)
      activeStep.value ++;
    else{
      animationSuccess.value = true;
      animationSuccessWidget.iniciaAnimacao(RegistrationCompletedTabletPhone());
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
    if(cellPhoneTyped.length > 14)
      cellPhoneTextController.value = maskCellPhoneFormatter.updateMask(mask: "(##) #####-####");
    else
      cellPhoneTextController.value = maskCellPhoneFormatter.updateMask(mask: "(##) ####-#####");
  }
}