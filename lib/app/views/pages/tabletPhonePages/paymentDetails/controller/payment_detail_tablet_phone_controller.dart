import 'dart:ui';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../shared/popups/bottom_sheet_tablet_phone_popup.dart';
import '../../studentRequest/popup/payment_form_tablet_phone_popup.dart';

class PaymentDetailTabletPhoneController extends GetxController {
  late String buttonText;
  late Color buttonColor;
  final CardPaymentViewController cardPaymentViewController;

  PaymentDetailTabletPhoneController(this.cardPaymentViewController){
    _initializeVariables();
  }

  _initializeVariables(){
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
        cardPaymentViewController.raNumber,
        cardPaymentViewController.paymentType,
        cardPaymentViewController.bankingInstitution,
        cardPaymentViewController.bankCnpj,
        cardPaymentViewController.billValue,
        DateFormatToBrazil.formatDate(DateTime.now()),
      );
      BottomSheetTabletPhonePopup.showAlert(
        Get.context!,
        PaymentFormTabletPhonePopup(payment).getWidgetList(
          Get.context!,
        ),
        .3,
      );
    }
    else{

    }
  }
}