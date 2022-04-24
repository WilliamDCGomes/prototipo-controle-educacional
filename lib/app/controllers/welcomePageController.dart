import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/loginPageTabletPhone.dart';
import '../views/componentsWidgets/tabletPhoneComponentWidget/stepperPagesWidget.dart';

class WelcomePageController extends GetxController {
  late int activeStep;
  late List<StepperPagesWidget> pageIntroduction;
  late CarouselController carouselController;

  WelcomePageController(){
    activeStep = 0;
    carouselController = CarouselController();
    _loadIntroductionPages();
  }

  goToLoginPage() async {
    await Future.delayed(Duration(milliseconds: 200));
    await Get.offAll(LoginPageTablePhone());
  }

  _loadIntroductionPages(){
    pageIntroduction = [
      StepperPagesWidget(
        imagePath: 'Ilustracao_01.png',
        firstText: 'Bem vindo ao',
        secondText: 'Protótipo de Controle Educacional',
        thirdText: 'O aplicativo oficial para os estudantes terem acesso a todos os conteúdos acadêmico.\n',
      ),
      StepperPagesWidget(
        imagePath: 'Ilustracao_02.png',
        firstText: 'Acesse todos os Conteúdos',
        secondText: 'disponibilizados pelos professores',
        thirdText: 'Com a facilidade na palma das suas mãos, tenha o acesso aos documentos das aulas e controle de sua presença, assim como suas notas.',
      ),
      StepperPagesWidget(
        imagePath: 'Ilustracao_03.png',
        firstText: 'Tenha o controle financeiro',
        secondText: 'e realize solicitações de documentos',
        thirdText: 'Emita a 2º via de boleto, realize pagamentos com cartões, tudo isso para contribuir com os nossos estudantes.',
      ),
    ];
  }

  nextPage() async {
    await carouselController.onReady;
    if(activeStep < 2) {
      activeStep++;
      carouselController.nextPage();
    }
    else
      goToLoginPage();
  }

  previousPage() async {
    await carouselController.onReady;
    if(activeStep > 0) {
      activeStep--;
      carouselController.previousPage();
    }
  }

  backStepper() async {
    return await Future.delayed(
        const Duration(
            milliseconds: 100
        ),
        () {
          return activeStep <= 0;
        }
    );
  }
}