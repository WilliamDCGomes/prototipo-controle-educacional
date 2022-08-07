import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../shared/widgets/copy_bar_code_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';

class PendingPaymentTabletPhonePage extends StatelessWidget {
  final PaymentFinishedViewController paymentFinishedViewController;

  const PendingPaymentTabletPhonePage({
    Key? key,
    required this.paymentFinishedViewController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.backgroundFirstScreenColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TitleWithBackButtonTabletPhoneWidget(
                  title: "Pagamento Boleto",
                ),
                Image.asset(
                  Paths.Ilustracao_03,
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: TextWidget(
                    "Pagamento Pendente",
                    textColor: AppColors.blackColor,
                    fontSize: 18.sp,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: .5.h),
                          child: TextWidget(
                            "Nome",
                            textColor: AppColors.blackColor,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        TextWidget(
                          paymentFinishedViewController.userName,
                          textColor: AppColors.blackColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
                          child: TextWidget(
                            "Pagamento",
                            textColor: AppColors.blackColor,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        TextWidget(
                          "${paymentFinishedViewController.paymentTitle} | Boleto",
                          textColor: AppColors.blackColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
                          child: TextWidget(
                            "Instituição Bancária Destinada",
                            textColor: AppColors.blackColor,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        TextWidget(
                          paymentFinishedViewController.bankingInstitutionDestined,
                          textColor: AppColors.blackColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
                          child: TextWidget(
                            "CNPJ",
                            textColor: AppColors.blackColor,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        TextWidget(
                          paymentFinishedViewController.bankingCnpj,
                          textColor: AppColors.blackColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
                          child: TextWidget(
                            "Valor",
                            textColor: AppColors.blackColor,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        TextWidget(
                          "R\$ ${paymentFinishedViewController.paymentValue}",
                          textColor: AppColors.blackColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
                          child: TextWidget(
                            "Código do Boleto",
                            textColor: AppColors.blackColor,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        CopyBarCodeTabletPhoneWidget(
                          successText: "Código de barras copiado com sucesso!",
                          valueCopy: "34191.09008 10799.489181 11334.800007 1 90220000157816",
                          widgetCustom: TextWidget(
                            "34191.09008 10799.489181 11334.800007 1 90220000157816",
                            textColor: AppColors.blueLinkColor,
                            fontSize: 16.sp,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            fontWeight: FontWeight.bold,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonWidget(
                  hintText: "BAIXAR BOLETO",
                  fontWeight: FontWeight.bold,
                  widthButton: 90.w,
                  textColor: AppColors.orangeColor,
                  borderColor: AppColors.orangeColor,
                  backgroundColor: AppColors.whiteColor,
                  onPressed: () {

                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                  child: ButtonWidget(
                    hintText: "VOLTAR PARA O MENU",
                    fontWeight: FontWeight.bold,
                    widthButton: 90.w,
                    onPressed: () => Get.offAll(() => MainMenuTabletPhonePage()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
