import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/main_menu_tablet_phone_controller.dart';
import '../../../../helpers/paths.dart';
import '../../../stylePages/app_colors.dart';
import '../../rich_text_two_different_widget.dart';
import '../../text_button_widget.dart';
import '../../text_widget.dart';

class CardFinancialWidget extends StatelessWidget {
  final String statusText;
  final String paymentDay;
  final String plotValue;
  final bool? hasCardRegistered;
  final MainMenuTabletPhoneController mainMenuTabletPhoneController;

  const CardFinancialWidget(
      { Key? key,
        required this.statusText,
        required this.paymentDay,
        required this.plotValue,
        this.hasCardRegistered,
        required this.mainMenuTabletPhoneController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 18.5.h,
        width: 95.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
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
                            " ${statusText}",
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
                          firstText: "Vencimento:",
                          secondText: paymentDay,
                          firstTextSize: 16.sp,
                          secondTextSize: 16.sp,
                          firstTextFontWeight: FontWeight.normal,
                          secondTextFontWeight: FontWeight.bold,
                          firstTextColor: AppColors.blackColor,
                          secondTextColor: AppColors.blackColor,
                          secondTextDecoration: TextDecoration.none,
                        ),
                        TextWidget(
                          plotValue,
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
                        visible: hasCardRegistered ?? false,
                        child: TextButtonWidget(
                          onTap: () {

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
                                " Pagar com cartão cadastrado",
                                maxLines: 1,
                                textColor: AppColors.blueLinkColor,
                                fontSize: 17.sp,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButtonWidget(
                        onTap: () {

                        },
                        height: 4.h,
                        componentPadding: EdgeInsets.zero,
                        widgetCustom: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Paths.Icone_Copiar,
                              width: 2.h,
                            ),
                            TextWidget(
                              " Copiar código de barras",
                              maxLines: 1,
                              textColor: AppColors.blueLinkColor,
                              fontSize: 17.sp,
                              textAlign: TextAlign.center,
                            ),
                          ],
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