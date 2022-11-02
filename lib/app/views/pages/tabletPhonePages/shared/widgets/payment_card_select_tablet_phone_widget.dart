import 'package:carousel_slider/carousel_slider.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import 'credit_debt_card_tablet_phone_widget.dart';

class PaymentCardSelectTabletPhoneWidget extends StatefulWidget {
  late final RxInt creditDebtCardActiveStep;
  late final bool showTitleCard;
  late final bool showRemoveBottom;
  late final bool showEditBottom;
  late final CreditCardType? flagCard;
  late final String titleCards;
  late final Function() onClicked;
  late final Function()? onRemoveClicked;
  late final double? creditDebtCardWidgetHeight;
  late final List<CreditDebtCardTabletPhoneWidget> creditDebtCardList;
  late final CarouselController carouselCreditDebtCardController;

  PaymentCardSelectTabletPhoneWidget(
      { Key? key,
        required this.titleCards,
        required this.onClicked,
        required this.showTitleCard,
        required this.creditDebtCardActiveStep,
        required this.creditDebtCardList,
        required this.carouselCreditDebtCardController,
        this.showRemoveBottom = false,
        this.showEditBottom = false,
        this.creditDebtCardWidgetHeight,
        this.onRemoveClicked,
        this.flagCard,
      }) : super(key: key);

  @override
  State<PaymentCardSelectTabletPhoneWidget> createState() => _PaymentCardSelectTabletPhoneWidgetState();
}

class _PaymentCardSelectTabletPhoneWidgetState extends State<PaymentCardSelectTabletPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: SizedBox(
              height: widget.creditDebtCardWidgetHeight ?? 20.h,
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
                      widget.creditDebtCardActiveStep.value = itemIndex;
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: TextWidget(
                  widget.titleCards,
                  textColor: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.creditDebtCardList.length > 1,
            child: Center(
              child: DotStepper(
                dotCount: widget.creditDebtCardList.length < 2 ? 2 : widget.creditDebtCardList.length,
                dotRadius: 1.h,
                activeStep: widget.creditDebtCardActiveStep.value,
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
                    widget.creditDebtCardActiveStep.value = tappedDotIndex;
                    widget.carouselCreditDebtCardController.jumpToPage(tappedDotIndex);
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.showRemoveBottom,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 0),
              child: ButtonWidget(
                hintText: "Remover Cartão",
                fontWeight: FontWeight.bold,
                heightButton: 5.h,
                borderColor: AppColors.orangeColor,
                backgroundColor: AppColors.orangeColor,
                onPressed: widget.onRemoveClicked,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 0),
            child: ButtonWidget(
              hintText: widget.showEditBottom ? "Editar Cartão" : "Adicionar Cartão",
              fontWeight: FontWeight.bold,
              heightButton: 5.h,
              onPressed: widget.onClicked,
            ),
          ),
        ],
      ),
    );
  }
}