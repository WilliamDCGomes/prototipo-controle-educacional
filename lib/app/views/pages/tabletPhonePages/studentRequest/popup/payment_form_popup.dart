import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controller/student_request_controller.dart';
import '../widget/bottom_select_payment_form_widget.dart';

class PaymentFormPopup {
  late RxBool cardSelected;
  late RxBool bankSlipSelected;
  late StudentRequestController studentRequestController;

  PaymentFormPopup(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    cardSelected = true.obs;
    bankSlipSelected = false.obs;
    studentRequestController = Get.find(tag: "student-request-controller");
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
            "Como deseja fazer o pagamento da solicitação",
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
              child: BottomSelectPaymentFormWidget(
                cardTitle: "Cartão de Crédito",
                cardSelected: cardSelected,
              ),
            ),
            InkWell(
              onTap: (){
                cardSelected.value = false;
                bankSlipSelected.value = true;
              },
              child: BottomSelectPaymentFormWidget(
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
            studentRequestController.selectPaymentForm(
              cardSelected.value ? paymentMethod.creditCard : paymentMethod.bankSlip,
            );
          },
        ),
      ),
    ];
  }
}