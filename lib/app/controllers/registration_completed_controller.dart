import 'package:get/get.dart';
import '../views/pages/tabletPhonePages/login_page_tablet_phone_page.dart';

class RegistrationCompletedController extends GetxController {
  late String firstText;
  late String secondText;
  late String thirdText;
  late String siteText;

  RegistrationCompletedController(){
    _initializeVariables();
  }

  _initializeVariables(){
    firstText = 'OBAA! QUE LEGAL!';
    secondText = "Agora é só aguardar! Em breve lhe enviaremos um E-mail para que você possa acessar a nossa plataforma";
    thirdText = "Sua conta logo estará disponível para acessar os recursos do PCE, caso tenha dúvidas entre em contato em nosso site.";
    siteText = "www.pcdeduc.com.br";
  }

  backToLoginPage(){
    Get.offAll(LoginPageTablePhone());
  }

  openWebSite() async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}