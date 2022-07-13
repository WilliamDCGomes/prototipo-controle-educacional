import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../stylePages/app_colors.dart';
import '../../shared/widgets/snackbar_widget.dart';

class QrCodeScannerController extends GetxController {
  Barcode? result;
  late QRViewController? qrCodeController;

  QrCodeScannerController(){
    _initializeVariables();
  }

  _initializeVariables(){

  }

  qrCodeReaded(){
    SnackbarWidget(
      warningText: "Sucesso",
      informationText: "Código: ${result!.code}",
      backgrondColor: AppColors.purpleDefaultColorWithOpacity,
    );
  }
}