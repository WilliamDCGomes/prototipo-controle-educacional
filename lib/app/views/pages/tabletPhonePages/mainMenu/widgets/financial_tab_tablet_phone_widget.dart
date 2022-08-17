import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../allPayments/page/all_payments_tablet_phone_page.dart';
import '../../cardPayment/page/card_payment_tablet_phone_page.dart';
import '../../cardRegistration/page/card_registration_tablet_phone_page.dart';
import '../../shared/widgets/payment_card_select_tablet_phone_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import 'card_financial_tablet_phone_widget.dart';
import 'componentTabWidget/card_payment_list_tablet_phone_widget.dart';

class FinancialTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  FinancialTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FinancialTabTabletPhoneWidget> createState() => _FinancialTabTabletPhoneWidgetState();
}

class _FinancialTabTabletPhoneWidgetState extends State<FinancialTabTabletPhoneWidget> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.controller.tabFinancialController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        widget.controller.creditDebtCardActiveStep.value = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Container(
                  height: 8.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        "Financeiro",
                        textColor: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        textAlign: TextAlign.start,
                      ),
                      SvgPicture.asset(
                        Paths.Logo_Pce_Home,
                        width: 15.w,
                      ),
                    ],
                  ),
                ),
                CardFinancialTabletPhoneWidget(
                  paymentFinishedViewController: widget.controller.nextBillToPay,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                "Cartão Cadastrado",
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                                textAlign: TextAlign.start,
                              ),
                              TextButtonWidget(
                                onTap: () => Get.to(() => CardPaymentTabletPhonePage()),
                                hintText: "Ver Todos",
                                fontWeight: FontWeight.normal,
                                textDecoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                          PaymentCardSelectTabletPhoneWidget(
                            titleCards: "Cartão Cadastrado ${LoggedUser.nameAndLastName}",
                            showTitleCard: true,
                            creditDebtCardWidgetHeight: 25.h,
                            creditDebtCardActiveStep: widget.controller.creditDebtCardActiveStep,
                            creditDebtCardList: widget.controller.creditDebtCardList,
                            carouselCreditDebtCardController: widget.controller.carouselCreditDebtCardController,
                            onClicked: () => Get.to(() => CardRegistrationTabletPhonePage()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  "Últimos Boletos/Lançamentos",
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  textAlign: TextAlign.start,
                                ),
                                TextButtonWidget(
                                  onTap: () => Get.to(() => AllPaymentsTabletPhonePage()),
                                  hintText: "Ver Todos",
                                  fontWeight: FontWeight.normal,
                                  textDecoration: TextDecoration.underline,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.controller.cardPaymentList.length,
                            itemBuilder: (context, index){
                              return CardPaymentListTabletPhoneWidget(
                                cardPaymentViewController: widget.controller.cardPaymentList[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
