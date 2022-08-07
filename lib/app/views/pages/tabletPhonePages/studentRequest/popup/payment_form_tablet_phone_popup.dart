import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../utils/format_numbers.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../selectCardPayment/page/select_card_payment_tablet_phone_page.dart';
import '../pages/pending_payment_tablet_phone_page.dart';
import '../widget/bottom_select_payment_form_tablet_phone_widget.dart';

class PaymentFormTabletPhonePopup {
  late RxBool cardSelected;
  late RxBool bankSlipSelected;
  late PaymentFinishedViewController paymentFinishedViewController;

  PaymentFormTabletPhonePopup(this.paymentFinishedViewController){
    _inicializeVariables();
  }

  _inicializeVariables(){
    cardSelected = true.obs;
    bankSlipSelected = false.obs;
  }

  List<Widget> getWidgetList(context){
    return [
      Center(
        child: Container(
          height: .5.h,
          width: 40.w,
          color: AppColors.grayStepColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Center(
          child: TextWidget(
            "Como deseja fazer o pagamento",
            textColor: AppColors.blackColor,
            fontSize: 16.sp,
            textAlign: TextAlign.center,
            maxLines: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                cardSelected.value = true;
                bankSlipSelected.value = false;
              },
              child: BottomSelectPaymentFormTabletPhoneWidget(
                cardTitle: "Cartão",
                cardSelected: cardSelected,
              ),
            ),
            InkWell(
              onTap: (){
                cardSelected.value = false;
                bankSlipSelected.value = true;
              },
              child: BottomSelectPaymentFormTabletPhoneWidget(
                cardTitle: "Boleto",
                cardSelected: bankSlipSelected,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: ButtonWidget(
          hintText: "AVANÇAR",
          fontWeight: FontWeight.bold,
          widthButton: 75.w,
          onPressed: () {
            Get.back();
            if(cardSelected.value){
              var paymentCard = SelectCardPaymentViewController(
                paymentFinishedViewController.userName,
                paymentFinishedViewController.paymentTitle,
                paymentFinishedViewController.raNumber,
                FormatNumbers.stringToNumber(paymentFinishedViewController.paymentValue),
                DateTime.now(),
              );
              Get.to(() => SelectCardPaymentTabletPhonePage(
                selectCardPaymentViewController: paymentCard,
              ));
            }
            else{
              Get.to(() => PendingPaymentTabletPhonePage(
                paymentFinishedViewController: paymentFinishedViewController,
              ));
            }
          },
        ),
      ),
    ];
  }
}