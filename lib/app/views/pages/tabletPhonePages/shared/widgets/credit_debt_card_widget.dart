import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/flag_card_type.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class CreditDebtCardWidget extends StatelessWidget {
  final String? numericEnd;
  final String? personCardName;
  final String? cardExpirationDate;
  final double? width;
  final double? height;
  final double? paddingHeightName;
  final CreditCardType? flagCard;
  final creditDebtCardType? creditDebtCardTypeEnum;

  const CreditDebtCardWidget(
      { Key? key,
        this.numericEnd,
        this.personCardName,
        this.cardExpirationDate,
        this.width,
        this.height,
        this.flagCard,
        this.paddingHeightName,
        this.creditDebtCardTypeEnum,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              creditDebtCardTypeEnum == creditDebtCardType.debit ?
                Paths.Debit_Card : Paths.Credit_Card,
              height: height ?? 20.h,
              width: width ?? 40.h,
              fit: BoxFit.fill,
            ),
          ),
          Visibility(
            visible: flagCard != null,
            child: Center(
              child: Container(
                height: height ?? 20.h,
                width: width ?? 40.h,
                margin: EdgeInsets.only(top: 2.h, right: 5.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    FlagCardType.getFlagCard(flagCard),
                    width: (height ?? 20.h) / 3.5,
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: height ?? 20.h,
              width: width ?? 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (height != null ? height! : 20.h)/2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: TextWidget(
                        "*** **** **** ${numericEnd}",
                        textColor: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, top: paddingHeightName ?? 1.h, right: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: TextWidget(
                              personCardName ?? "",
                              textColor: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          TextWidget(
                            cardExpirationDate ?? "",
                            textColor: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}