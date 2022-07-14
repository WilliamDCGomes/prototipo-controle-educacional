import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../../widgetsShared/text_widget.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../paymentDetails/page/payment_detail_tablet_phone_page.dart';

class CardPaymentListTabletPhoneWidget extends StatelessWidget {
  final CardPaymentViewController cardPaymentViewController;

  const CardPaymentListTabletPhoneWidget(
      { Key? key,
        required this.cardPaymentViewController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.5.h, bottom: 1.h),
      child: SizedBox(
        height: 10.h,
        width: double.infinity,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 2.2.h,
                                  width: .5.h,
                                  color: cardPaymentViewController.getCardColor,
                                ),
                                Expanded(
                                  child: TextWidget(
                                    " ${cardPaymentViewController.getStatusName}",
                                    textColor: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: RichTextTwoDifferentWidget(
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
                            ),
                          ],
                        ),
                      ),
                      TextWidget(
                        "R\$ ${cardPaymentViewController.billValue}",
                        maxLines: 1,
                        textColor: cardPaymentViewController.getCardColor,
                        fontSize: 18.sp,
                        textAlign: TextAlign.end,
                        fontWeight: FontWeight.bold,
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