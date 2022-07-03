import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../paymentDetails/page/payment_detail_tablet_phone_page.dart';

class CardAllBillsDetailWidget extends StatelessWidget {
  final CardPaymentViewController cardPaymentViewController;

  const CardAllBillsDetailWidget(
      { Key? key,
        required this.cardPaymentViewController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.5.h, 0, 1.h),
      child: SizedBox(
        height: 14.h,
        width: 90.w,
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: () => Get.to(() => PaymentDetailTabletPhonePage(
              pageTitle: "Detalhe da Fatura",
              cardPaymentViewController: cardPaymentViewController,
            )),
            borderRadius: 1.h,
            componentPadding: EdgeInsets.all(.5.w),
            widgetCustom: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 2.3.h,
                                  width: .5.h,
                                  color: cardPaymentViewController.getCardColor,
                                ),
                                Expanded(
                                  child: TextWidget(
                                    " ${cardPaymentViewController.getStatusName}",
                                    textColor: cardPaymentViewController.getCardColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            TextWidget(
                              cardPaymentViewController.paymentType,
                              textColor: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                            RichTextTwoDifferentWidget(
                              firstText: "Vencimento: ",
                              secondText: cardPaymentViewController.dueDate,
                              firstTextSize: 16.sp,
                              secondTextSize: 16.sp,
                              firstTextFontWeight: FontWeight.normal,
                              secondTextFontWeight: FontWeight.bold,
                              firstTextColor: AppColors.blackColor,
                              secondTextColor: AppColors.blackColor,
                              secondTextDecoration: TextDecoration.none,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 1.h,),
                          TextWidget(
                            "R\$ ${cardPaymentViewController.billValue}",
                            maxLines: 1,
                            textColor: cardPaymentViewController.getCardColor,
                            fontSize: 18.sp,
                            textAlign: TextAlign.end,
                            fontWeight: FontWeight.bold,
                          ),
                          RichTextTwoDifferentWidget(
                            firstText: "Pagamento: ",
                            secondText: cardPaymentViewController.getPaymentDate,
                            firstTextSize: 16.sp,
                            secondTextSize: 16.sp,
                            firstTextFontWeight: FontWeight.normal,
                            secondTextFontWeight: FontWeight.bold,
                            firstTextColor: AppColors.blackColor,
                            secondTextColor: AppColors.blackColor,
                            secondTextDecoration: TextDecoration.none,
                          ),
                        ],
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