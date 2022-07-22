import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/select_card_payment_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../cardRegistration/page/card_registration_tablet_phone_page.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/payment_card_select_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/select_card_payment_tablet_phone_controller.dart';

class SelectCardPaymentTabletPhonePage extends StatefulWidget {
  late final SelectCardPaymentViewController selectCardPaymentViewController;
  SelectCardPaymentTabletPhonePage({
    Key? key,
    required this.selectCardPaymentViewController,
  }) : super(key: key);

  @override
  State<SelectCardPaymentTabletPhonePage> createState() => _SelectCardPaymentTabletPhonePageState();
}

class _SelectCardPaymentTabletPhonePageState extends State<SelectCardPaymentTabletPhonePage> {
  late SelectCardPaymentTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(SelectCardPaymentTabletPhoneController(widget.selectCardPaymentViewController));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        controller.creditDebtCardActiveStep.value = 0;
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
                padding: EdgeInsets.only(top: 2.h,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h,),
                      child: TitleWithBackButtonTabletPhoneWidget(
                        title: "Forma de Pagamento",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InformationContainerTabletPhoneWidget(
                            iconPath: Paths.Icone_Exibicao_Forma_de_Pagamento,
                            textColor: AppColors.whiteColor,
                            backgroundColor: AppColors.purpleDefaultColor,
                            informationText: "",
                            customContainer: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                  controller.selectCardPaymentViewController.getTitleName,
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
                                    secondText: controller.selectCardPaymentViewController.getPaymentValue,
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h,),
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
                                      child: PaymentCardSelectTabletPhoneWidget(
                                        titleCards: "",
                                        showTitleCard: false,
                                        creditDebtCardWidgetHeight: 25.h,
                                        creditDebtCardActiveStep: controller.creditDebtCardActiveStep,
                                        creditDebtCardList: controller.creditDebtCardList,
                                        carouselCreditDebtCardController: controller.carouselCreditDebtCardController,
                                        onClicked: () => Get.to(() => CardRegistrationTabletPhonePage()),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5.h),
                                    child: ButtonWidget(
                                      hintText: "PAGAR",
                                      fontWeight: FontWeight.bold,
                                      widthButton: 75.w,
                                      onPressed: () => controller.payRequest(),
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
              controller.loadingWithSuccessOrErrorTabletPhoneWidget,
            ],
          ),
        ),
      ),
    );
  }
}
