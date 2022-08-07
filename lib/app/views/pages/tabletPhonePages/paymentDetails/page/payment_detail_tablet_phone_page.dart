import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/payment_detail_tablet_phone_controller.dart';

class PaymentDetailTabletPhonePage extends StatefulWidget {
  final String pageTitle;
  final CardPaymentViewController cardPaymentViewController;
  const PaymentDetailTabletPhonePage({
    Key? key,
    required this.pageTitle,
    required this.cardPaymentViewController,
  }) : super(key: key);

  @override
  State<PaymentDetailTabletPhonePage> createState() => _PaymentDetailTabletPhonePageState();
}

class _PaymentDetailTabletPhonePageState extends State<PaymentDetailTabletPhonePage> {
  late PaymentDetailTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(PaymentDetailTabletPhoneController(widget.cardPaymentViewController));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    Paths.Ilustracao_Topo,
                    width: 25.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h,),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: widget.pageTitle,
                        ),
                      ),
                      InformationContainerTabletPhoneWidget(
                        iconPath: Paths.Icone_Exibicao_Detalhe_da_Fatura,
                        textColor: AppColors.purpleDefaultColor,
                        backgroundColor: AppColors.whiteColor,
                        informationText: "",
                        padding: EdgeInsets.zero,
                        customContainer: Row(
                          children: [
                            Container(
                              height: 12.h,
                              width: 1.h,
                              decoration: BoxDecoration(
                                color: controller.cardPaymentViewController.getCardColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(1.h),
                                  bottomLeft: Radius.circular(1.h),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: TextWidget(
                                      "R\$ ${controller.cardPaymentViewController.billValue}",
                                      textColor: controller.cardPaymentViewController.getCardColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: .1.h),
                                    child: TextWidget(
                                      "Valor Total",
                                      textColor: AppColors.blackColor,
                                      fontSize: 14.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                    child: TextWidget(
                                      controller.cardPaymentViewController.getFullStatus,
                                      textColor: AppColors.blackColor,
                                      fontSize: 16.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h,),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              TextWidget(
                                "Nome:",
                                textColor: AppColors.blackColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  controller.cardPaymentViewController.userName,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Detalhe do Pagamento:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  controller.cardPaymentViewController.paymentType,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Instituição Bancária:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  controller.cardPaymentViewController.bankingInstitution,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "CNPJ:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  controller.cardPaymentViewController.bankCnpj,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Data do Pagamento:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  controller.cardPaymentViewController.dueDate,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                        child: ButtonWidget(
                          hintText: controller.buttonText,
                          fontWeight: FontWeight.bold,
                          widthButton: 100.w,
                          backgroundColor: controller.buttonColor,
                          borderColor: controller.buttonColor,
                          textColor: AppColors.whiteColor,
                          onPressed: () => controller.buttonPressed(),
                        ),
                      ),
                    ],
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
