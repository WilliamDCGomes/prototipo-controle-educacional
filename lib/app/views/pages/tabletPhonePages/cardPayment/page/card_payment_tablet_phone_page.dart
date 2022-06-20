import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../cardRegistration/page/card_registration_tablet_phone_page.dart';
import '../../shared/widgets/payment_card_select_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/card_payment_controller.dart';

class CardPaymentTabletPhonePage extends StatefulWidget {
  CardPaymentTabletPhonePage({Key? key,}) : super(key: key);

  @override
  State<CardPaymentTabletPhonePage> createState() => _CardPaymentTabletPhonePageState();
}

class _CardPaymentTabletPhonePageState extends State<CardPaymentTabletPhonePage> {
  late CardPaymentController controller;

  @override
  void initState() {
    controller = Get.put(CardPaymentController());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        controller.creditDebtCardActiveStep = 0;
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
                          title: "Cartões",
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
                              child: Center(
                                child: TextWidget(
                                  "Cartões cadastrados na plataforma para pagamentos",
                                  textColor: AppColors.whiteColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.h),
                                      child: PaymentCardSelectWidget(
                                        titleCards: "",
                                        showTitleCard: false,
                                        showRemoveBottom: true,
                                        showEditBottom: true,
                                        creditDebtCardWidgetHeight: 25.h,
                                        creditDebtCardActiveStep: controller.creditDebtCardActiveStep,
                                        creditDebtCardList: controller.creditDebtCardList,
                                        carouselCreditDebtCardController: controller.carouselCreditDebtCardController,
                                        onClicked: () => Get.to(() => CardRegistrationTabletPhonePage(editCard: true,)),
                                        onRemoveClicked: (){

                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.h),
                                    child: ButtonWidget(
                                      hintText: "ADICIONAR",
                                      fontWeight: FontWeight.bold,
                                      widthButton: 75.w,
                                      onPressed: () => Get.to(() => CardRegistrationTabletPhonePage()),
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
            ],
          ),
        ),
      ),
    );
  }
}