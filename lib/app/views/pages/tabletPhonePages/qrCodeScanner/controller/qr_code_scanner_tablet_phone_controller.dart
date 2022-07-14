import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../stylePages/app_colors.dart';
import '../../shared/widgets/snackbar_tablet_phone_widget.dart';

class QrCodeScannerTabletPhoneController extends GetxController {
  Barcode? result;
  late QRViewController? qrCodeController;

  QrCodeScannerTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){

  }

  qrCodeReaded() async {
    Get.back();
    await Future.delayed(Duration(milliseconds: 200));
    SnackbarTabletPhoneWidget(
      warningText: "Sucesso",

      informationText: "Código: ${result!.code}",
      backgrondColor: AppColors.purpleDefaultColorWithOpacity,
    );
  }
}