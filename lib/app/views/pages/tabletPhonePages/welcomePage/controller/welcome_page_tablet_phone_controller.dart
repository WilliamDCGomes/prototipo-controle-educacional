import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../../shared/widgets/stepper_pages_tablet_phone_widget.dart';
import '../../login/page/login_page_tablet_phone_page.dart';

class WelcomePageTabletPhoneController extends GetxController {
  late int activeStep;
  late List<StepperPagesTabletPhoneWidget> pageIntroduction;
  late CarouselController carouselController;

  WelcomePageTabletPhoneController(){
    activeStep = 0;
    carouselController = CarouselController();
    _loadIntroductionPages();
  }

  goToLoginPage() async {
    await Get.offAll(() => LoginPageTabletPhone());
  }

  _loadIntroductionPages(){
    pageIntroduction = [
      StepperPagesTabletPhoneWidget(
        imagePath: 'ilustracao_01.png',
        firstText: 'Bem vindo ao',
        secondText: 'Protótipo de Controle Educacional',
        thirdText: 'O aplicativo oficial para os estudantes terem acesso a todos os conteúdos acadêmico.\n',
      ),
      StepperPagesTabletPhoneWidget(
        imagePath: 'ilustracao_02.png',
        firstText: 'Acesse todos os Conteúdos',
        secondText: 'disponibilizados pelos professores',
        thirdText: 'Com a facilidade na palma das suas mãos, tenha o acesso aos documentos das aulas e controle de sua presença, assim como suas notas.',
      ),
      StepperPagesTabletPhoneWidget(
        imagePath: 'ilustracao_03.png',
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