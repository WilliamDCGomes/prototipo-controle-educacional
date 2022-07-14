import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';

class RegistrationCompletedTabletPhoneController extends GetxController {
  late String firstText;
  late String secondText;
  late String thirdText;
  late String siteText;

  RegistrationCompletedTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    firstText = 'OBAA! QUE LEGAL!';
    secondText = "Agora é só aguardar! Em breve lhe enviaremos um E-mail para que você possa acessar a nossa plataforma";
    thirdText = "Sua conta logo estará disponível para acessar os recursos do PCE, caso tenha dúvidas entre em contato em nosso site.";
    siteText = "www.pcdeduc.com.br";
  }

  backToLoginPage(){
    Get.offAll(() => LoginPageTabletPhone());
  }

  openWebSite() async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}