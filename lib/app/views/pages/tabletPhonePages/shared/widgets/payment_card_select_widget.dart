import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import 'credit_debt_card_widget.dart';

class PaymentCardSelectWidget extends StatefulWidget {
  late int creditDebtCardActiveStep;
  late bool showTitleCard;
  late final String titleCards;
  late final Function() onTap;
  late final Function() onTapEditCard;
  late final double creditDebtCardWidgetHeight;
  late final List<CreditDebtCardWidget> creditDebtCardList;
  late final CarouselController carouselCreditDebtCardController;

  PaymentCardSelectWidget(
      { Key? key,
        required this.titleCards,
        required this.onTap,
        required this.onTapEditCard,
        required this.showTitleCard,
        required this.creditDebtCardWidgetHeight,
        required this.creditDebtCardActiveStep,
        required this.creditDebtCardList,
        required this.carouselCreditDebtCardController,
      }) : super(key: key);

  @override
  State<PaymentCardSelectWidget> createState() => _PaymentCardSelectWidgetState();
}

class _PaymentCardSelectWidgetState extends State<PaymentCardSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: SizedBox(
            height: widget.creditDebtCardWidgetHeight,
            child: CarouselSlider.builder(
              carouselController: widget.carouselCreditDebtCardController,
              itemCount: widget.creditDebtCardList.length,
              options: CarouselOptions(
                  viewportFraction: .85,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (itemIndex, reason){
                    setState(() {
                      widget.creditDebtCardActiveStep = itemIndex;
                    });
                  }
              ),
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                return widget.creditDebtCardList[itemIndex];
              },
            ),
          ),
        ),
        Visibility(
          visible: widget.showTitleCard,
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtonWidget(
                  onTap: widget.onTapEditCard,
                  componentPadding: EdgeInsets.zero,
                  widgetCustom: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: TextWidget(
                          widget.titleCards,
                          textColor: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SvgPicture.asset(
                        Paths.Icone_Editar,
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: widget.creditDebtCardList.length > 1,
          child: Center(
            child: DotStepper(
              dotCount: widget.creditDebtCardList.length,
              dotRadius: 1.h,
              activeStep: widget.creditDebtCardActiveStep,
              shape: Shape.stadium,
              spacing: 3.w,
              indicator: Indicator.magnify,
              fixedDotDecoration: FixedDotDecoration(
                color: AppColors.grayStepColor,
              ),
              indicatorDecoration: IndicatorDecoration(
                color: AppColors.purpleDefaultColor,
              ),
              onDotTapped: (tappedDotIndex) {
                setState(() {
                  widget.creditDebtCardActiveStep = tappedDotIndex;
                  widget.carouselCreditDebtCardController.jumpToPage(tappedDotIndex);
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 0),
          child: ButtonWidget(
            hintText: "Adicionar Cartão",
            fontWeight: FontWeight.bold,
            heightButton: 5.h,
            onPressed: widget.onTap,
          ),
        ),
      ],
    );
  }
}