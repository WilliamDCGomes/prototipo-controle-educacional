import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/payment_finished_view_controller.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/popups/bottom_sheet_popup.dart';
import '../../studentRequest/popup/payment_form_popup.dart';
import '../../../../stylePages/app_colors.dart';

class CardFinancialWidget extends StatelessWidget {
  final PaymentFinishedViewController paymentFinishedViewController;

  const CardFinancialWidget(
      { Key? key,
        required this.paymentFinishedViewController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 15.h,
        width: 95.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          color: AppColors.whiteColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: .5.h,
                  ),
                  SizedBox(
                    width: 66.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 3.h,
                          width: .8.h,
                          color: AppColors.purpleDefaultColor,
                        ),
                        SizedBox(
                          width: 65.w,
                          child: TextWidget(
                            " ${paymentFinishedViewController.statusText}",
                            textColor: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 66.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextTwoDifferentWidget(
                          firstText: "Vencimento: ",
                          secondText: paymentFinishedViewController.dueDate,
                          firstTextSize: 16.sp,
                          secondTextSize: 16.sp,
                          firstTextFontWeight: FontWeight.normal,
                          secondTextFontWeight: FontWeight.bold,
                          firstTextColor: AppColors.blackColor,
                          secondTextColor: AppColors.blackColor,
                          secondTextDecoration: TextDecoration.none,
                        ),
                        TextWidget(
                          "R\$ ${paymentFinishedViewController.paymentValue}",
                          textColor: AppColors.blueMoneyFinancialCardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: paymentFinishedViewController.hasCardRegistered ?? false,
                        child: TextButtonWidget(
                          onTap: () {
                            var payment = PaymentFinishedViewController(
                              paymentFinishedViewController.userName,
                              paymentFinishedViewController.raNumber,
                              paymentFinishedViewController.paymentTitle,
                              paymentFinishedViewController.bankingInstitutionDestined,
                              paymentFinishedViewController.bankingCnpj,
                              paymentFinishedViewController.paymentValue,
                              paymentFinishedViewController.paymentDate,
                            );
                            BottomSheetPopup.showAlert(
                              Get.context!,
                              PaymentFormPopup(payment).getWidgetList(
                                Get.context!,
                              ),
                              .3,
                            );
                          },
                          height: 4.h,
                          componentPadding: EdgeInsets.zero,
                          widgetCustom: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.credit_card,
                                size: 3.h,
                                color: AppColors.blueLinkColor,
                              ),
                              TextWidget(
                                " Pagar próxima fatura",
                                maxLines: 1,
                                textColor: AppColors.blueLinkColor,
                                fontSize: 17.sp,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}