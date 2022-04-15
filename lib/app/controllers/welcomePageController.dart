import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/loginPageTabletPhone.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/StepperPagesWidget.dart';

class WelcomePageController extends GetxController {
  late RxInt activeStep;
  late bool allowSwipe;
  late double lastScreenValue;

  WelcomePageController(){
    activeStep = 0.obs;
    allowSwipe = true;
    lastScreenValue = 0;
  }

  goToLoginPage(){
    Get.offAll(LoginPageTablePhone());
  }

  Widget getCurrentPage(){
    switch(activeStep.value){
      case 0:
        return StepperPagesWidget(
          imagePath: 'Ilustracao_01.png',
          firstText: 'Bem vindo ao',
          secondText: 'Protótipo de Controle Educacional',
          thirdText: 'O aplicativo oficial para os estudantes terem acesso a todos os conteúdos acadêmico.\n',
        );
      case 1:
        return StepperPagesWidget(
          imagePath: 'Ilustracao_02.png',
          firstText: 'Acesse todos os Conteúdos',
          secondText: 'disponibilizados pelos professores',
          thirdText: 'Com a facilidade na palma das suas mãos, tenha o acesso aos documentos das aulas e controle de sua presença, assim como suas notas.',
        );
      default:
        return StepperPagesWidget(
          imagePath: 'Ilustracao_03.png',
          firstText: 'Tenha o controle financeiro',
          secondText: 'e realize solicitações de documentos',
          thirdText: 'Emita a 2º via de boleto, realize pagamentos com cartões, tudo isso para contribuir com os nossos estudantes.',
        );
    }
  }

  nextPage(){
    if(activeStep.value < 2)
      activeStep.value++;
    else
      goToLoginPage();
  }

  previousPage(){
    if(activeStep.value > 0)
      activeStep.value--;
  }

  backStepper() async {
    bool backScreen = false;
    if (activeStep.value > 0) {
      activeStep.value--;
      backScreen = false;
    }
    else
      backScreen = true;
    return await Future.delayed(
        const Duration(
            milliseconds: 100
        ),
        () {
          return backScreen;
        }
    );
  }
}