import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controller/qr_code_scanner_controller.dart';

class QrCodeScannerTabletPhonePage extends StatefulWidget {
  const QrCodeScannerTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerTabletPhonePage> createState() => _QrCodeScannerTabletPhonePageState();
}

class _QrCodeScannerTabletPhonePageState extends State<QrCodeScannerTabletPhonePage> {
  late QrCodeScannerController controller;

  @override
  void initState() {
    controller = Get.put(QrCodeScannerController());
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.qrCodeController?.pauseCamera();
    } else if (Platform.isIOS) {
      controller.qrCodeController?.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller.qrCodeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            QRView(
              key: GlobalKey(debugLabel: 'QR'),
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.purpleDefaultColor,
                borderRadius: 1.h,
                borderLength: 5.h,
                borderWidth: 2.h,
                cutOutSize: 35.h,
              ),
              onQRViewCreated: (QRViewController controller) {
                this.controller.qrCodeController = controller;
                this.controller.qrCodeController?.scannedDataStream.listen((scanData) {
                  setState(() {
                    this.controller.result = scanData;
                  });
                  this.controller.qrCodeReaded();
                });
              },
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
              padding: EdgeInsets.all(1.h),
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.circular(1.h),
              ),
              child: TextWidget(
                "Coloque o Código QR dentro do quadrado.",
                textColor: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 18.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(
                      "LEIA O CÓDIGO QR",
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextWidget(
                        "Para acessar sua Conta",
                        textColor: AppColors.orangeColor,
                        fontSize: 22.sp,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.w, top: 1.h),
              child: TextButtonWidget(
                onTap: () => Get.back(),
                widgetCustom: Icon(
                  Icons.close,
                  color: AppColors.whiteColor,
                  size: 5.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
