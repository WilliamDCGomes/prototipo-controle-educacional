import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/payment_detail_controller.dart';

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
  late PaymentDetailController controller;

  @override
  void initState() {
    controller = Get.put(PaymentDetailController(widget.cardPaymentViewController));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
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
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWithBackButtonWidget(
                        title: widget.pageTitle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: PlatformType.isTablet(context) ?
                          9.h : 7.h,
                        ),
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: .5.h,
                                  decoration: BoxDecoration(
                                    color: controller.cardPaymentViewController.getCardColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(1.h),
                                      topRight: Radius.circular(1.h),
                                    ),
                                  ),
                                ),
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
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 3.h),
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
                        padding: EdgeInsets.symmetric(vertical: 2.h),
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
