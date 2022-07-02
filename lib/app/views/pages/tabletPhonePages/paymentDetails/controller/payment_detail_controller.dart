import 'dart:ui';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../shared/widgets/loading_with_success_or_error_widget.dart';
import '../../studentRequest/pages/payment_finished_page.dart';

class PaymentDetailController extends GetxController {
  late String buttonText;
  late Color buttonColor;
  late RxBool loadingAnimetion;
  final CardPaymentViewController cardPaymentViewController;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;

  PaymentDetailController(this.cardPaymentViewController){
    _initializeVariables();
  }

  _initializeVariables(){
    loadingAnimetion = false.obs;

    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget(
      loadingAnimetion: loadingAnimetion,
    );

    if(cardPaymentViewController.status == paymentStatus.finished){
      buttonText = "COMPARTILHAR";
      buttonColor = AppColors.orangeColor;
    }
    else{
      buttonText = "PAGAR";
      buttonColor = AppColors.purpleDefaultColor;
    }
  }

  buttonPressed() async {
    if(buttonText == "PAGAR"){
      var payment = PaymentFinishedViewController(
        cardPaymentViewController.userName,
        cardPaymentViewController.paymentType,
        cardPaymentViewController.bankingInstitution,
        cardPaymentViewController.bankCnpj,
        cardPaymentViewController.billValue,
        DateFormatToBrazil.formatDate(DateTime.now()),
      );
      loadingAnimetion.value = true;
      loadingWithSuccessOrErrorWidget.startAnimation(
        destinationPage: PaymentFinished(
          paymentFinishedViewController: payment,
        ),
      );
    }
    else{

    }
  }
}