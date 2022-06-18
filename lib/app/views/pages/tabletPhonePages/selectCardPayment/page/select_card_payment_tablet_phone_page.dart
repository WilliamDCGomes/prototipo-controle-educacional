import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/payment_card_select_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/select_card_payment_controller.dart';

class SelectCardPaymentTabletPhonePage extends StatefulWidget {
  late SelectCardPaymentViewController selectCardPaymentViewController;
  SelectCardPaymentTabletPhonePage({
    Key? key,
    required this.selectCardPaymentViewController,
  }) : super(key: key);

  @override
  State<SelectCardPaymentTabletPhonePage> createState() => _SelectCardPaymentTabletPhonePageState();
}

class _SelectCardPaymentTabletPhonePageState extends State<SelectCardPaymentTabletPhonePage> {
  late SelectCardPaymentController studentRequestController;

  @override
  void initState() {
    studentRequestController = Get.put(SelectCardPaymentController(widget.selectCardPaymentViewController));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        studentRequestController.creditDebtCardActiveStep = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.backgroundFirstScreenColor,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: SvgPicture.asset(
                  Paths.Ilustracao_Topo,
                  width: 25.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 8.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: TitleWithBackButtonWidget(
                          title: "Forma de Pagamento",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 95.w,
                              margin: EdgeInsets.only(
                                top: PlatformType.isTablet(context) ? 9.h : 7.h,
                                bottom: 5.h,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                color: AppColors.purpleDefaultColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    studentRequestController.selectCardPaymentViewController.getTitleName,
                                    textColor: AppColors.whiteColor,
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.5.h),
                                    child: RichTextTwoDifferentWidget(
                                      firstText: "Valor: ",
                                      firstTextColor: AppColors.whiteColor,
                                      firstTextFontWeight: FontWeight.normal,
                                      firstTextSize: 16.sp,
                                      secondText: studentRequestController.selectCardPaymentViewController.getPaymentValue,
                                      secondTextColor: AppColors.whiteColor,
                                      secondTextFontWeight: FontWeight.bold,
                                      secondTextSize: 16.sp,
                                      secondTextDecoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextWidget(
                                      "Selecione o cartão para o pagamento",
                                      textColor: AppColors.blackColor,
                                      fontSize: 18.sp,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.h),
                                      child: PaymentCardSelectWidget(
                                        titleCards: "",
                                        showTitleCard: false,
                                        creditDebtCardWidgetHeight: 25.h,
                                        creditDebtCardActiveStep: studentRequestController.creditDebtCardActiveStep,
                                        creditDebtCardList: studentRequestController.creditDebtCardList,
                                        carouselCreditDebtCardController: studentRequestController.carouselCreditDebtCardController,
                                        onTap: (){

                                        },
                                        onTapEditCard: (){

                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.h),
                                    child: ButtonWidget(
                                      hintText: "PAGAR",
                                      fontWeight: FontWeight.bold,
                                      widthButton: 75.w,
                                      onPressed: () => studentRequestController.payRequest(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              studentRequestController.animationSuccessWidget,
            ],
          ),
        ),
      ),
    );
  }
}
