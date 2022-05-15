import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/componentsWidgets/textWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../enums/enums.dart';
import '../../helpers/paths.dart';
import '../stylePages/appColors.dart';

class CreditDebtCardWidget extends StatelessWidget {
  final String? numericEnd;
  final String? personCardName;
  final String? cardExpirationDate;
  final double? height;
  final double? width;
  final creditDebtCardType? creditDebtCardTypeEnum;

  const CreditDebtCardWidget(
      { Key? key,
        this.numericEnd,
        this.personCardName,
        this.cardExpirationDate,
        this.height,
        this.width,
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
              creditDebtCardTypeEnum == creditDebtCardType.mastercard ?
                Paths.Cartao_Roxo_PCE : Paths.Cartao_Laranja_PCE,
              height: height ?? 20.h,
              width: width ?? 40.h,
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
                      padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
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